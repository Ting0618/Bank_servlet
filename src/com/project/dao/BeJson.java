package com.project.dao;

import net.sf.json.JSONObject;

public class BeJson {
	public BeJson() {  
        // TODO Auto-generated constructor stub  
    }  
      
    public String ObjectJson(Object obj){  
        JSONObject json = JSONObject.fromObject(obj);//��java����ת��Ϊjson����  
        String str = json.toString();//��json����ת��Ϊ�ַ���            
        return str;  
    }  
}
