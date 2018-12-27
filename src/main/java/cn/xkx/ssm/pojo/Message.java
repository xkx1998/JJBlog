package cn.xkx.ssm.pojo;

import java.util.HashMap;
import java.util.Map;

/**
 * 通用的类
 */
public class Message {
    //状态吗，100-成功，200-失败
    private int code;

    //提示信息
    private String message;

    //用户要返回给浏览器的数据
    private Map<String,Object> extend = new HashMap<String,Object>();

    //成功信息
    public static Message success() {
        Message result = new Message();
        result.setCode(100);
        result.setMessage("处理成功");
        return result;
    }

    //失败信息
    public static Message fail() {
        Message result = new Message();
        result.setCode(200);
        result.setMessage("处理失败");
        return result;
    }

    public Message add(String key, Object value) {
        this.getExtend().put(key,value);
        return this;
    }
    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
