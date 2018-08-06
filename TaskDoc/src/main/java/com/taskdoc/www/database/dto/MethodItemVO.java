package com.taskdoc.www.database.dto;

import org.apache.ibatis.type.Alias;

@Alias("methoditem")
public class MethodItemVO {
	private int micode;
	private String mititle;
	private int misequence;
	private String method;
	
	
	public int getMicode() {
		return micode;
	}
	public void setMicode(int micode) {
		this.micode = micode;
	}
	public String getMititle() {
		return mititle;
	}
	public void setMititle(String mititle) {
		this.mititle = mititle;
	}
	public int getMisequence() {
		return misequence;
	}
	public void setMisequence(int misequence) {
		this.misequence = misequence;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
}
