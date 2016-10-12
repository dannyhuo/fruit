package com.scrum.model;

import java.util.Date;

public class SprintTaskItem {
    private Long taskItemId;

    private String taskItemNo;

    private Long taskId;

    private String taskItemName;

    private Short elapsedTime;

    private Long developer;

    private Short developerPercent;

    private String isTest;

    private String testor;

    private String testNo;

    private Short testPercent;

    private String isOnLine;

    private Date onLineDate;

    private Date createTime;

    private String remark;

    public Long getTaskItemId() {
        return taskItemId;
    }

    public void setTaskItemId(Long taskItemId) {
        this.taskItemId = taskItemId;
    }

    public String getTaskItemNo() {
        return taskItemNo;
    }

    public void setTaskItemNo(String taskItemNo) {
        this.taskItemNo = taskItemNo == null ? null : taskItemNo.trim();
    }

    public Long getTaskId() {
        return taskId;
    }

    public void setTaskId(Long taskId) {
        this.taskId = taskId;
    }

    public String getTaskItemName() {
        return taskItemName;
    }

    public void setTaskItemName(String taskItemName) {
        this.taskItemName = taskItemName == null ? null : taskItemName.trim();
    }

    public Short getElapsedTime() {
        return elapsedTime;
    }

    public void setElapsedTime(Short elapsedTime) {
        this.elapsedTime = elapsedTime;
    }

    public Long getDeveloper() {
        return developer;
    }

    public void setDeveloper(Long developer) {
        this.developer = developer;
    }

    public Short getDeveloperPercent() {
        return developerPercent;
    }

    public void setDeveloperPercent(Short developerPercent) {
        this.developerPercent = developerPercent;
    }

    public String getIsTest() {
        return isTest;
    }

    public void setIsTest(String isTest) {
        this.isTest = isTest == null ? null : isTest.trim();
    }

    public String getTestor() {
        return testor;
    }

    public void setTestor(String testor) {
        this.testor = testor == null ? null : testor.trim();
    }

    public String getTestNo() {
        return testNo;
    }

    public void setTestNo(String testNo) {
        this.testNo = testNo == null ? null : testNo.trim();
    }

    public Short getTestPercent() {
        return testPercent;
    }

    public void setTestPercent(Short testPercent) {
        this.testPercent = testPercent;
    }

    public String getIsOnLine() {
        return isOnLine;
    }

    public void setIsOnLine(String isOnLine) {
        this.isOnLine = isOnLine == null ? null : isOnLine.trim();
    }

    public Date getOnLineDate() {
        return onLineDate;
    }

    public void setOnLineDate(Date onLineDate) {
        this.onLineDate = onLineDate;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}