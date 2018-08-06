package com.taskdoc.www.database.dto;

import org.apache.ibatis.type.Alias;

@Alias("method")
public class MethodVO {
	private String method;
	private String mcontents;
	
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getMcontents() {
		return mcontents;
	}
	public void setMcontents(String mcontents) {
		this.mcontents = mcontents;
	}
	
}
