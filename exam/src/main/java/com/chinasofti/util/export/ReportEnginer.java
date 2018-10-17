package com.chinasofti.util.export;


import freemarker.cache.StringTemplateLoader;
import freemarker.template.TemplateException;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import jxl.Cell;
import jxl.CellType;
import jxl.Range;
import jxl.Workbook;
import jxl.WorkbookSettings;
import jxl.write.Label;
import jxl.write.Number;
import jxl.write.WritableCell;
import jxl.write.WritableCellFeatures;
import jxl.write.WritableImage;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

public class ReportEnginer {
    private static Logger LOG = Logger.getLogger(ReportEnginer.class);
    public static final String DIRECTIVE_NUMBER = "?number";
    public static final String DIRECTIVE_IMAGE = "?image";
    public static final String[] ftlTags = new String[]{"${", "<#", "</#"};
    private static final String REMOVE_ROW = "1";
    private static final String REMOVE_COLUMN = "2";
    private static final String NOT_REMOVE_ROW = "3";
    private static final String NOT_REMOVE_COLUMN = "4";
    private static final String FTL_ROW_OR_COLUMN = "5";
    private static final String LINE_SEPARATOR = System.getProperty("line.separator");
    private Map<String, String> inListTagCells = new LinkedHashMap();

    public ReportEnginer() {
    }

    public void excute(String templateFile, Map<String, Object> context, String destFile) throws Exception {
        FileInputStream input = null;
        FileOutputStream out = null;

        try {
            input = new FileInputStream(templateFile);
            out = new FileOutputStream(destFile);
            this.excute((InputStream)input, context, (OutputStream)out);
        } finally {
            if(input != null) {
                input.close();
            }

            if(out != null) {
                out.close();
            }

        }

    }

    public void excute(InputStream input, Map<String, Object> context, OutputStream out) throws Exception {
        Workbook workbook = null;
        WritableWorkbook writableWorkbook = null;

        try {
            workbook = Workbook.getWorkbook(input);
            writableWorkbook = Workbook.createWorkbook(out, workbook, new WorkbookSettings());
            WritableSheet[] sheets = writableWorkbook.getSheets();

            for(int i = 0; i < sheets.length; ++i) {
                WritableSheet writableSheet = sheets[i];

                try {
                    this.prepare(writableSheet);
                    String ftl = this.convertSheetAsFtl(writableSheet);
                    if(StringUtils.isBlank(ftl)) {
                        LOG.debug(writableSheet.getName() + " no freemarker tag context");
                    } else {
                        LOG.debug(ftl);
                        String ftlResult = this.convertFtl(context, ftl.trim(), writableSheet.getName());
                        if(StringUtils.isBlank(ftlResult)) {
                            LOG.debug(writableSheet.getName() + " no out context");
                        } else {
                            this.exportResultToSheet(writableSheet, ftlResult.trim());
                        }
                    }
                } finally {
                    this.cleanup(writableSheet);
                }
            }
        } finally {
            if(workbook != null) {
                try {
                    workbook.close();
                } catch (Exception var21) {
                    ;
                }
            }

            if(writableWorkbook != null) {
                writableWorkbook.write();
                writableWorkbook.close();
            }

        }

    }

    private void prepare(WritableSheet writableSheet) {
        writableSheet.insertRow(0);
        writableSheet.insertColumn(0);
        LOG.debug("prepare");
    }

    private void cleanup(WritableSheet writableSheet) {
        writableSheet.removeRow(0);
        writableSheet.removeColumn(0);
        LOG.debug("clean up");
    }

    private String convertSheetAsFtl(WritableSheet writableSheet) throws RowsExceededException, WriteException {
        LinkedHashMap tagCells = new LinkedHashMap();
        int rows = writableSheet.getRows();
        int columns = writableSheet.getColumns();
        StringBuffer ftl = new StringBuffer();
        int listStartCounter = 0;
        int listEndCounter = 0;
        int ifStartCounter = 0;
        int ifEndCounter = 0;

        for(int row = 0; row < rows; ++row) {
            ArrayList rowTags = null;
            StringBuffer rowFtl = new StringBuffer();
            this.rowStart(row, rowFtl);

            for(int column = 0; column < columns; ++column) {
                WritableCell writableCell = writableSheet.getWritableCell(column, row);
                String contents = writableCell.getContents();
                boolean listStart = this.isListStartTag(contents);
                boolean listEnd = this.isListEndTag(contents);
                boolean ifStart = this.isIfStartTag(contents);
                boolean ifEnd = this.isIfEndTag(contents);
                if(listStart) {
                    ++listStartCounter;
                }

                if(listEnd) {
                    ++listEndCounter;
                }

                if(ifStart) {
                    ++ifStartCounter;
                }

                if(ifEnd) {
                    ++ifEndCounter;
                }

                if(!listStart && !listEnd && !ifStart && !ifEnd) {
                    this.parseCell(writableSheet, writableCell, row, column, rowFtl, listStartCounter > listEndCounter, ifStartCounter > ifEndCounter);
                } else {
                    rowFtl.append(contents);
                    if(rowTags == null) {
                        rowTags = new ArrayList();
                    }

                    rowTags.add(writableCell);
                }
            }

            this.rowEnd(row, rowFtl);
            if(rowTags != null) {
                tagCells.put(Integer.valueOf(row), rowTags);
            }

            if(this.rowHasContents(row, rowFtl)) {
                ftl.append(rowFtl);
                this.lineEnd(ftl);
            }
        }

        this.markRemoveRowClumn(writableSheet, tagCells);
        return ftl.toString();
    }

    public String convertFtl(Map<String, Object> context, String ftl, String id) throws TemplateException, IOException {
        StringTemplateLoader stringTemplateLoader = new StringTemplateLoader();
        stringTemplateLoader.putTemplate(id, ftl);
        StringWriter stringWriter = FreemarkerHelper.produceAsStringWriter(stringTemplateLoader, context, "UTF-8", (String)null, id, "UTF-8");
        return stringWriter != null?stringWriter.toString():null;
    }

    private void exportResultToSheet(WritableSheet writableSheet, String result) throws RowsExceededException, NumberFormatException, WriteException, IOException, Exception {
        BufferedReader in = new BufferedReader(new StringReader(result));
        String line = null;
        int toRow = -1;
        LinkedHashMap firstFilledRows = new LinkedHashMap();
        LinkedHashMap firstFilledColumns = new LinkedHashMap();
        LinkedHashMap copyRows = new LinkedHashMap();
        LinkedHashMap copyColumns = new LinkedHashMap();
        LinkedHashMap mergeCells = new LinkedHashMap();

        while(true) {
            while((line = in.readLine()) != null) {
                int startInd = line.indexOf("<r_");
                if(startInd == -1) {
                    LOG.debug(line + " is not a row !");
                } else {
                    int startEndInd = line.indexOf(">");
                    int orgRow = Integer.parseInt(line.substring(startInd + 3, startEndInd));
                    String endTag = "</r_" + orgRow + ">";
                    int newRow = orgRow + this.getInsertBeforeRows(copyRows, orgRow).intValue();
                    if(toRow < newRow) {
                        toRow = this.computeToRow(writableSheet, newRow);
                    } else {
                        Integer endInd = (Integer)firstFilledRows.get(Integer.valueOf(orgRow));
                        if(endInd == null) {
                            endInd = Integer.valueOf(orgRow);
                        }

                        ++toRow;
                        Range[] mergedCell = writableSheet.getMergedCells();

                        for(int key = 0; key < mergedCell.length; ++key) {
                            int x1 = mergedCell[key].getTopLeft().getRow();
                            int x2 = mergedCell[key].getBottomRight().getRow();
                            if(endInd.intValue() == x1) {
                                toRow += x2 - x1;
                                break;
                            }
                        }

                        String var22 = endInd + "-" + toRow;
                        if(!copyRows.containsKey(var22)) {
                            this.copyRow(writableSheet, mergeCells, endInd.intValue(), toRow);
                            copyRows.put(var22, Integer.valueOf(toRow));
                        }
                    }

                    int var21 = line.indexOf(endTag);
                    line = line.substring(startEndInd + 1, var21);
                    if(firstFilledRows.get(Integer.valueOf(orgRow)) == null) {
                        firstFilledRows.put(Integer.valueOf(orgRow), Integer.valueOf(toRow));
                    }

                    this.exportLineToRow(writableSheet, mergeCells, line, toRow, copyColumns, firstFilledColumns);
                }
            }

            this.mergeCells(writableSheet, mergeCells);
            this.removeRowColumn(writableSheet, copyRows, copyColumns);
            return;
        }
    }

    private void mergeCells(WritableSheet writableSheet, Map<String, String> mergeCells) throws RowsExceededException, NumberFormatException, WriteException {
        Iterator iterator = mergeCells.values().iterator();

        while(iterator.hasNext()) {
            String str = (String)iterator.next();
            String[] arr = str.split(",");
            if(arr.length == 4) {
                writableSheet.mergeCells(Integer.parseInt(arr[1]), Integer.parseInt(arr[0]), Integer.parseInt(arr[3]), Integer.parseInt(arr[2]));
            }
        }

    }

    private void exportLineToRow(WritableSheet writableSheet, Map<String, String> mergeCells, String line, int toRow, Map<String, Integer> copyColumns, Map<Integer, Integer> firstFilledColumns) throws Exception {
        int toColumn = -1;

        int columns;
        String ftlTag;
        int var20;
        int var25;
        for(boolean startInd = true; (var20 = line.indexOf("<c_")) != -1; line = line.substring(var25 + ftlTag.length())) {
            columns = line.indexOf(">");
            String col = line.substring(var20 + 3, columns);
            boolean writableCell = false;

            int var22;
            try {
                var22 = Integer.parseInt(col);
            } catch (Exception var19) {
                LOG.info(toRow + " : " + line);
                LOG.error(var19.getMessage());
                throw var19;
            }

            ftlTag = "</c_" + var22 + ">";
            int newColumn = var22 + this.getInsertBeforeColumns(copyColumns, var22);
            if(toColumn < newColumn) {
                toColumn = this.computeToColumn(writableSheet, newColumn);
            } else {
                Integer endInd = (Integer)firstFilledColumns.get(Integer.valueOf(var22));
                if(endInd == null) {
                    endInd = Integer.valueOf(var22);
                }

                ++toColumn;
                Range[] contents = writableSheet.getMergedCells();

                for(int key = 0; key < contents.length; ++key) {
                    int y1 = contents[key].getTopLeft().getColumn();
                    int y2 = contents[key].getBottomRight().getColumn();
                    if(endInd.intValue() == y1) {
                        toColumn += y2 - y1;
                        break;
                    }
                }

                String var27 = endInd + "-" + toColumn;
                if(!copyColumns.containsKey(var27)) {
                    this.copyColumn(writableSheet, mergeCells, endInd.intValue(), toColumn);
                    copyColumns.put(var27, Integer.valueOf(toColumn));
                }
            }

            if(firstFilledColumns.get(Integer.valueOf(var22)) == null) {
                firstFilledColumns.put(Integer.valueOf(var22), Integer.valueOf(toColumn));
            }

            var25 = line.indexOf(ftlTag);
            String var26 = line.substring(columns + 1, var25);
            this.exportCell(writableSheet, mergeCells, toRow, toColumn, var26);
            if(line.length() <= var25 + ftlTag.length()) {
                break;
            }
        }

        columns = writableSheet.getColumns();

        for(int var21 = 0; var21 < columns; ++var21) {
            WritableCell var23 = writableSheet.getWritableCell(var21, toRow);
            boolean var24 = StringUtils.indexOfAny(var23.getContents(), ftlTags) != -1;
            if(var24) {
                this.setCell(writableSheet, mergeCells, toRow, var21, "");
            }
        }

    }

    private int computeToColumn(WritableSheet writableSheet, int toColumn) {
        int cols = writableSheet.getColumns();

        int i;
        for(i = toColumn; i < cols; ++i) {
            Cell cell = writableSheet.getCell(i, 0);
            if(!CellType.LABEL.equals(cell.getType()) || !"2".equals(cell.getContents())) {
                break;
            }
        }

        return i;
    }

    private int computeToRow(WritableSheet writableSheet, int toRow) {
        int rows = writableSheet.getRows();

        int i;
        for(i = toRow; i < rows; ++i) {
            Cell cell = writableSheet.getCell(0, i);
            if(!CellType.LABEL.equals(cell.getType()) || !"1".equals(cell.getContents())) {
                break;
            }
        }

        return i;
    }

    private void exportCell(WritableSheet writableSheet, Map<String, String> mergeCells, int row, int column, String contents) throws Exception {
        this.setCell(writableSheet, mergeCells, row, column, contents);
        this.setCell(writableSheet, mergeCells, row, 0, "3");
        this.setCell(writableSheet, mergeCells, 0, column, "4");
    }

    private boolean setCell(WritableSheet writableSheet, Map<String, String> mergeCells, int row, int column, String contents) throws RowsExceededException, WriteException {
        WritableCell writableCell = writableSheet.getWritableCell(column, row);
        if(this.isNumberDirective(contents)) {
            if(this.setNumberCell(writableSheet, row, column, contents)) {
                return true;
            }

            contents = StringUtils.substringBeforeLast(contents, "?");
        }

        if(this.isImageDirective(contents)) {
            if(this.setImageCell(writableSheet, mergeCells, row, column, contents)) {
                return true;
            }

            contents = StringUtils.substringBeforeLast(contents, "?");
        }

        if(CellType.LABEL.equals(writableCell.getType())) {
            ((Label)writableCell).setString(contents);
        } else {
            Label newWritableCell = new Label(column, row, contents);
            if(writableCell.getWritableCellFeatures() != null) {
                newWritableCell.setCellFeatures(writableCell.getWritableCellFeatures());
            }

            if(writableCell.getCellFormat() != null) {
                newWritableCell.setCellFormat(writableCell.getCellFormat());
            }

            writableSheet.addCell(newWritableCell);
        }

        return true;
    }

    private boolean setNumberCell(WritableSheet writableSheet, int row, int column, String contents) throws RowsExceededException, WriteException {
        try {
            WritableCell ne = writableSheet.getWritableCell(column, row);
            int start = contents.indexOf("?");
            String num = contents.substring(0, start).trim();
            double val = Double.parseDouble(num);
            if(CellType.NUMBER.equals(ne.getType())) {
                ((Number)ne).setValue(val);
            } else {
                Number newWritableCell = new Number(column, row, val);
                if(ne.getWritableCellFeatures() != null) {
                    newWritableCell.setCellFeatures(ne.getWritableCellFeatures());
                }

                if(ne.getCellFormat() != null) {
                    newWritableCell.setCellFormat(ne.getCellFormat());
                }

                writableSheet.addCell(newWritableCell);
            }

            return true;
        } catch (NumberFormatException var11) {
            LOG.error("Error: " + row + "," + column + ":" + contents + var11.getMessage());
            return false;
        }
    }

    private boolean setImageCell(WritableSheet writableSheet, Map<String, String> mergeCells, int row, int column, String contents) throws RowsExceededException, WriteException {
        int start = contents.indexOf("?");
        String filePath = contents.substring(0, start).trim();
        filePath = StringUtils.replace(filePath, "\\", "/");
        if(!StringUtils.endsWithIgnoreCase(filePath, ".png")) {
            LOG.warn("Only support png image file : " + filePath);
            return false;
        } else {
            File file = new File(filePath);
            if(!file.exists()) {
                LOG.warn("Not found file " + filePath);
                return false;
            } else if(file.isDirectory()) {
                LOG.warn("Excepted a png image file,but got a directory : " + filePath);
                return false;
            } else {
                int width = 1;
                int height = 1;
                Iterator mergedCell = mergeCells.values().iterator();

                int y1;
                int x2;
                int y2;
                while(mergedCell.hasNext()) {
                    String writableImage = (String)mergedCell.next();
                    String[] x1 = writableImage.split(",");
                    if(x1.length == 4) {
                        y1 = Integer.parseInt(x1[0]);
                        x2 = Integer.parseInt(x1[1]);
                        if(y1 == row && x2 == column) {
                            y2 = Integer.parseInt(x1[2]);
                            int y21 = Integer.parseInt(x1[3]);
                            width = y2 - y1 + 1;
                            height = y21 - x2 + 1;
                            break;
                        }
                    }
                }

                Range[] var18 = writableSheet.getMergedCells();

                for(int var19 = 0; var19 < var18.length; ++var19) {
                    int var21 = var18[var19].getTopLeft().getRow();
                    y1 = var18[var19].getTopLeft().getColumn();
                    if(var21 == row && y1 == column) {
                        x2 = var18[var19].getBottomRight().getRow();
                        y2 = var18[var19].getBottomRight().getColumn();
                        width = x2 - var21 + 1;
                        height = y2 - y1 + 1;
                        break;
                    }
                }

                WritableImage var20 = new WritableImage((double)(column - 1), (double)(row - 1), (double)height, (double)width, file);
                writableSheet.addImage(var20);
                return true;
            }
        }
    }

    private boolean isNumberDirective(String contents) {
        return contents != null && contents.lastIndexOf("?number") != -1;
    }

    private boolean isImageDirective(String contents) {
        return contents != null && contents.lastIndexOf("?image") != -1;
    }

    private void setComment(WritableSheet writableSheet, int row, int column, String comment) throws RowsExceededException, WriteException {
        WritableCell writableCell = writableSheet.getWritableCell(column, row);
        WritableCellFeatures cellFeatures = writableCell.getWritableCellFeatures();
        if(cellFeatures == null) {
            cellFeatures = new WritableCellFeatures();
            writableCell.setCellFeatures(cellFeatures);
        }

        cellFeatures.setComment(comment);
    }

    private Integer getInsertBeforeRows(Map<String, Integer> copyRows, int row) {
        int result = 0;
        Iterator iterator = copyRows.keySet().iterator();

        while(iterator.hasNext()) {
            String key = (String)iterator.next();
            String[] arr = key.split("-");
            int org = Integer.parseInt(arr[0]);
            if(org < row) {
                ++result;
            }
        }

        if(result > 0) {
            LOG.debug(" ====================== row " + row + " 前面增加了  " + result);
        }

        return Integer.valueOf(result);
    }

    private int getInsertBeforeColumns(Map<String, Integer> copyColumns, int column) {
        int result = 0;
        Iterator iterator = copyColumns.keySet().iterator();

        while(iterator.hasNext()) {
            String key = (String)iterator.next();
            String[] arr = key.split("-");
            int org = Integer.parseInt(arr[0]);
            if(org < column) {
                ++result;
            }
        }

        if(result > 0) {
            LOG.debug(" ====================== column " + column + " 前面增加了  " + result);
        }

        return result;
    }

    private void cleanCellContents(WritableCell cell) {
        if(CellType.LABEL.equals(cell.getType())) {
            ((Label)cell).setString("");
        } else if(CellType.NUMBER.equals(cell.getType())) {
            ((Number)cell).setValue(0.0D);
        }

    }

    private void copyRow(WritableSheet writableSheet, Map<String, String> mergeCells, int from, int to) throws RowsExceededException, WriteException {
        writableSheet.insertRow(to);
        int columns = writableSheet.getColumns();

        for(int mergedCell = 0; mergedCell < columns; ++mergedCell) {
            WritableCell i = writableSheet.getWritableCell(mergedCell, from);
            WritableCell x1 = i.copyTo(mergedCell, to);
            writableSheet.addCell(x1);
            if(this.inListTagCells.get(writableSheet.getName() + "," + from + "," + mergedCell) != null) {
                this.cleanCellContents(x1);
                this.inListTagCells.put(writableSheet.getName() + "," + to + "," + mergedCell, "");
            }
        }

        Range[] var18 = writableSheet.getMergedCells();

        for(int var19 = 0; var19 < var18.length; ++var19) {
            int var20 = var18[var19].getTopLeft().getRow();
            if(from == var20) {
                int y1 = var18[var19].getTopLeft().getColumn();
                int x2 = var18[var19].getBottomRight().getRow();
                int y2 = var18[var19].getBottomRight().getColumn();
                int newX2 = to + (x2 - var20);
                int newY2 = y2;
                String key = to + "," + y1 + "," + newX2 + "," + y2;
                mergeCells.put(key, key);

                int ind;
                for(ind = to; ind <= newX2; ++ind) {
                    this.setCell(writableSheet, mergeCells, ind, 0, "3");
                }

                for(ind = y1; ind <= newY2; ++ind) {
                    this.setCell(writableSheet, mergeCells, 0, ind, "4");
                }
            }
        }

    }

    private void copyColumn(WritableSheet writableSheet, Map<String, String> mergeCells, int from, int to) throws RowsExceededException, WriteException {
        writableSheet.insertColumn(to);
        int rows = writableSheet.getRows();

        for(int mergedCell = 0; mergedCell < rows; ++mergedCell) {
            WritableCell i = writableSheet.getWritableCell(from, mergedCell);
            WritableCell y1 = i.copyTo(to, mergedCell);
            writableSheet.addCell(y1);
            if(this.inListTagCells.get(writableSheet.getName() + "," + mergedCell + "," + from) != null) {
                this.cleanCellContents(y1);
                this.inListTagCells.put(writableSheet.getName() + "," + mergedCell + "," + to, "");
            }
        }

        Range[] var18 = writableSheet.getMergedCells();

        for(int var19 = 0; var19 < var18.length; ++var19) {
            int var20 = var18[var19].getTopLeft().getColumn();
            if(from == var20) {
                int x1 = var18[var19].getTopLeft().getRow();
                int x2 = var18[var19].getBottomRight().getRow();
                int y2 = var18[var19].getBottomRight().getColumn();
                int newX2 = x2;
                int newY2 = to + (y2 - var20);
                String key = x1 + "," + to + "," + x2 + "," + newY2;
                mergeCells.put(key, key);

                int ind;
                for(ind = x1; ind <= newX2; ++ind) {
                    this.setCell(writableSheet, mergeCells, ind, 0, "3");
                }

                for(ind = to; ind <= newY2; ++ind) {
                    this.setCell(writableSheet, mergeCells, 0, ind, "4");
                }
            }
        }

        LOG.debug(writableSheet.getName() + " copy column " + from + " to " + to);
    }

    private void markRemoveRowClumn(WritableSheet writableSheet, Map<Integer, List<WritableCell>> tagCells) throws RowsExceededException, WriteException {
        if(tagCells != null) {
            Iterator iterator = tagCells.keySet().iterator();

            while(true) {
                while(true) {
                    Integer row;
                    List rowTags;
                    do {
                        if(!iterator.hasNext()) {
                            return;
                        }

                        row = (Integer)iterator.next();
                        rowTags = (List)tagCells.get(row);
                    } while(rowTags.size() == 0);

                    if(rowTags.size() != 1) {
                        if(rowTags.size() % 2 == 1) {
                            throw new RuntimeException("row  " + row + " : tag error 没有正确结束");
                        }

                        int listEndTagCounter = 0;
                        int ifEndTagCounter = 0;
                        Iterator var9 = rowTags.iterator();

                        WritableCell writableCell;
                        while(var9.hasNext()) {
                            writableCell = (WritableCell)var9.next();
                            if(this.isListEndTag(writableCell.getContents())) {
                                ++listEndTagCounter;
                            }

                            if(this.isIfEndTag(writableCell.getContents())) {
                                ++ifEndTagCounter;
                            }
                        }

                        if(listEndTagCounter > 0 && listEndTagCounter != rowTags.size() / 2 || ifEndTagCounter > 0 && ifEndTagCounter != rowTags.size() / 2) {
                            throw new RuntimeException("row  " + row + " : tag error 开始和结束个数不匹配");
                        }

                        var9 = rowTags.iterator();

                        while(var9.hasNext()) {
                            writableCell = (WritableCell)var9.next();
                            int column = writableCell.getColumn();
                            this.setCell(writableSheet, (Map)null, 0, column, "2");
                            LOG.debug(writableSheet.getName() + " column " + column + " is freemarker tags");
                        }
                    } else {
                        this.setCell(writableSheet, (Map)null, row.intValue(), 0, "1");
                        LOG.debug(writableSheet.getName() + " row " + row + " is freemarker tag");
                    }
                }
            }
        }
    }

    private void removeRowColumn(WritableSheet writableSheet, Map<String, Integer> copyRows, Map<String, Integer> copyColumns) {
        int rows = writableSheet.getRows();
        int columns = writableSheet.getColumns();
        ArrayList delRows = new ArrayList();
        ArrayList delColumns = new ArrayList();

        int i;
        Cell image;
        for(i = 1; i < columns; ++i) {
            image = writableSheet.getCell(i, 0);
            if(CellType.LABEL.equals(image.getType()) && !StringUtils.isBlank(image.getContents()) && !"4".equals(image.getContents())) {
                writableSheet.removeColumn(i);
                delColumns.add(Integer.valueOf(i));
                LOG.debug(writableSheet.getName() + " remove column " + i);
                --i;
            }
        }

        for(i = 1; i < rows; ++i) {
            image = writableSheet.getCell(0, i);
            if(CellType.LABEL.equals(image.getType()) && !StringUtils.isBlank(image.getContents()) && !"3".equals(image.getContents())) {
                writableSheet.removeRow(i);
                delRows.add(Integer.valueOf(i));
                LOG.debug(writableSheet.getName() + " remove row " + i);
                --i;
            }
        }

        i = 0;
        if(delRows.size() != 0 || delColumns.size() != 0) {
            while(true) {
                try {
                    WritableImage var19 = writableSheet.getImage(i);
                    if(var19 != null) {
                        double r = var19.getY();
                        double c = var19.getX();
                        int cutR = 0;
                        Iterator delC = delRows.iterator();

                        while(delC.hasNext()) {
                            Integer cutC = (Integer)delC.next();
                            if((double)cutC.intValue() <= r) {
                                ++cutR;
                            }
                        }

                        if(cutR != 0) {
                            var19.setY(r - (double)cutR);
                        }

                        int var20 = 0;
                        Iterator var17 = delColumns.iterator();

                        while(var17.hasNext()) {
                            Integer var21 = (Integer)var17.next();
                            if((double)var21.intValue() <= c) {
                                ++var20;
                            }
                        }

                        if(var20 != 0) {
                            var19.setX(c - (double)var20);
                        }
                    }

                    ++i;
                } catch (Exception var18) {
                    break;
                }
            }
        }

    }

    private void parseCell(WritableSheet writableSheet, WritableCell writableCell, int row, int column, StringBuffer ftl, boolean inListTag, boolean inIfTag) throws RowsExceededException, WriteException {
        if(CellType.LABEL.equals(writableCell.getType())) {
            String contents = writableCell.getContents();
            boolean ftlTag = StringUtils.indexOfAny(contents, ftlTags) != -1;
            if(inListTag || inIfTag || ftlTag) {
                this.cellStart(row, column, ftl);
                ftl.append(contents);
                if(inListTag && ftlTag) {
                    this.inListTagCells.put(writableSheet.getName() + "," + writableCell.getRow() + "," + writableCell.getColumn(), "");
                }

                this.cellEnd(row, column, ftl);
                this.setCell(writableSheet, (Map)null, row, 0, "5");
                this.setCell(writableSheet, (Map)null, 0, column, "5");
            }
        }

    }

    private boolean rowHasContents(int row, StringBuffer rowFtl) {
        StringBuffer _temp = new StringBuffer();
        this.rowStart(row, _temp);
        this.rowEnd(row, _temp);
        if(rowFtl.toString().equals(_temp.toString())) {
            return false;
        } else {
            int len = ("<r_" + row + ">").length();
            if(this.isListStartTag(rowFtl.toString()) || this.isListEndTag(rowFtl.toString()) || this.isIfStartTag(rowFtl.toString()) || this.isIfEndTag(rowFtl.toString())) {
                rowFtl.delete(0, len);
                rowFtl.delete(rowFtl.length() - len - 1, rowFtl.length());
            }

            return true;
        }
    }

    private boolean isListStartTag(String contents) {
        return contents.indexOf("<#list ") != -1 && StringUtils.countMatches(contents, "<#list ") != StringUtils.countMatches(contents, "</#list>");
    }

    private boolean isListEndTag(String contents) {
        return contents.indexOf("</#list>") != -1 && StringUtils.countMatches(contents, "<#list ") != StringUtils.countMatches(contents, "</#list>");
    }

    private boolean isIfStartTag(String contents) {
        return contents.indexOf("<#if ") != -1 && StringUtils.countMatches(contents, "<#if ") != StringUtils.countMatches(contents, "</#if>");
    }

    private boolean isIfEndTag(String contents) {
        return contents.indexOf("</#if>") != -1 && StringUtils.countMatches(contents, "<#if ") != StringUtils.countMatches(contents, "</#if>");
    }

    private void cellStart(int row, int column, StringBuffer ftl) {
        ftl.append("<c_").append(column).append(">");
    }

    private void cellEnd(int row, int column, StringBuffer ftl) {
        ftl.append("</c_").append(column).append(">");
    }

    private void rowStart(int row, StringBuffer ftl) {
        ftl.append("<r_").append(row).append(">");
    }

    private void rowEnd(int row, StringBuffer ftl) {
        ftl.append("</r_").append(row).append(">");
    }

    private void lineEnd(StringBuffer ftl) {
        ftl.append(LINE_SEPARATOR);
    }
}
