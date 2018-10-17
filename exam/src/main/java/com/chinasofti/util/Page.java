package com.chinasofti.util;


public class Page {

    private Integer pageSize;//每页数量
    private Integer pageNum;//当前页
    private Integer totalCount;//总数量

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    /**
     * 获取过滤数量
     * @return
     */
    public Integer getLimitCount() {
        return (pageNum-1)*pageSize;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    /**
     * 获取总页数
     * @return
     */
    public Integer getTotalPage(){
        return (int)Math.ceil(totalCount/(pageSize+0.0));
    }

    public Page() {
    }

    public Page(Integer pageSize, Integer pageNum) {
        this.pageSize = pageSize;
        this.pageNum = pageNum;
    }



}
