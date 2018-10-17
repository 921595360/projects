package com.chinasofti.pojo;

/**
 * 题库
 */
public class Question {

    private Integer id;//题目编号
    private String title;//题目
    private String answer;//答案
    private Integer score;//分值

    private String choose;

    public String getChoose() {
        return choose;
    }

    public void setChoose(String choose) {
        this.choose = choose;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Question() {
    }

    public Question(Integer id, String title, String answer, Integer score, String choose) {
        this.id = id;
        this.title = title;
        this.answer = answer;
        this.score = score;
        this.choose = choose;
    }

    @Override
    public String toString() {
        return "Question{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", answer='" + answer + '\'' +
                ", score=" + score +
                '}';
    }
}
