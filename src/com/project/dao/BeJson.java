package com.project.dao;

import net.sf.json.JSONObject;

public class BeJson {
	public BeJson() {  
        // TODO Auto-generated constructor stub  
    }  
      
    public String ObjectJson(Object obj){  
        JSONObject json = JSONObject.fromObject(obj);//将java对象转换为json对象  
        String str = json.toString();//将json对象转换为字符串            
        return str;  
    }  
}
