package com.hhx.body;

import java.sql.Timestamp;

public class Msg {
    private String from;
    private String to;
    private Timestamp time;
    private boolean isnew;
    private String content;
    private String frompic;
    private String topic;

    public String getFrompic() {
        return frompic;
    }

    public void setFrompic(String frompic) {
        this.frompic = frompic;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public boolean isIsnew() {
        return isnew;
    }

    public void setIsnew(boolean isnew) {
        this.isnew = isnew;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
