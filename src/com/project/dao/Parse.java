package com.project.dao;

import net.sf.json.JSONObject;

import com.project.bean.UserVo;

public class Parse {
	private String jsonStr;      
    public Parse() {  
          
    }  
      
    public Parse(String str){  
        this.jsonStr = str;  
    }  
	
    /** 
     * ����json�ַ� 
     */  
    public void parse(){  
        JSONObject jsonObject = JSONObject.fromObject(jsonStr);  
        String account = jsonObject.getString("account");  
        double money = jsonObject.getInt("money");  
        String username = jsonObject.getString("username");  
        String userID = jsonObject.getString("userID"); 
        String reaname = jsonObject.getString("reaname");         
    }      
  //  把json转化为对象
    public UserVo JSON2Object(){  
  //  把json转化为字符串
        if(jsonStr.indexOf("[") != -1){  
            jsonStr = jsonStr.replace("[", "");  
        }  
        if(jsonStr.indexOf("]") != -1){  
            jsonStr = jsonStr.replace("]", "");  
        }  
        JSONObject obj = new JSONObject().fromObject(jsonStr);//��json�ַ�ת��Ϊjson����  
        UserVo jb = (UserVo)JSONObject.toBean(obj,UserVo.class);//����json����ת��ΪUserVo����  
        return jb;//转化为Uservo类型
    }  
}
