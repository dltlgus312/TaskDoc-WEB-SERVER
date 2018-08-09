package com.taskdoc.www.database.dto;

import org.apache.ibatis.type.Alias;

@Alias("chatroom")
public class ChatRoomVO {
	private int crcode;
	private String crdate;
	private int crmode;
	private int crclose;
	private int tcode;
	
	public int getCrcode() {
		return crcode;
	}
	public void setCrcode(int crcode) {
		this.crcode = crcode;
	}
	public String getCrdate() {
		return crdate;
	}
	public void setCrdate(String crdate) {
		this.crdate = crdate;
	}
	public int getCrmode() {
		return crmode;
	}
	public void setCrmode(int crmode) {
		this.crmode = crmode;
	}
	public int getCrclose() {
		return crclose;
	}
	public void setCrclose(int crclose) {
		this.crclose = crclose;
	}
	public int getTcode() {
		return tcode;
	}
	public void setTcode(int tcode) {
		this.tcode = tcode;
	}
	
}
