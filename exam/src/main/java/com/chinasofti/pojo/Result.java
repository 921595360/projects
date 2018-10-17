package com.chinasofti.pojo;

/**
 * 题库
 */
public class Result {

    private Integer userId;
    private String userName;
    private Integer quesId;//题目编号
    private String title;//题目
    private String answer;//答案
    private String myAnswer;//答案
    private Integer score;//分值
    private String choose;

    public String getChoose() {
        return choose;
    }

    public void setChoose(String choose) {
        this.choose = choose;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Integer getQuesId() {
        return quesId;
    }

    public void setQuesId(Integer quesId) {
        this.quesId = quesId;
    }

    public String getMyAnswer() {
        return myAnswer;
    }

    public void setMyAnswer(String myAnswer) {
        this.myAnswer = myAnswer;
    }

    public Result() {
    }

    public Result(Integer userId, String userName, Integer quesId, String title, String answer, String myAnswer, Integer score, String choose) {
        this.userId = userId;
        this.userName = userName;
        this.quesId = quesId;
        this.title = title;
        this.answer = answer;
        this.myAnswer = myAnswer;
        this.score = score;
        this.choose = choose;
    }




}
