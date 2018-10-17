package com.chinasofti.pojo;


public class Answer {
    private Integer userId;
    private Integer examId;
    private Integer quesId;
    private String answer;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getExamId() {
        return examId;
    }

    public void setExamId(Integer examId) {
        this.examId = examId;
    }

    public Integer getQuesId() {
        return quesId;
    }

    public void setQuesId(Integer quesId) {
        this.quesId = quesId;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public Answer() {
    }

    public Answer(Integer userId, Integer examId, Integer quesId, String answer) {
        this.userId = userId;
        this.examId = examId;
        this.quesId = quesId;
        this.answer = answer;
    }
}
