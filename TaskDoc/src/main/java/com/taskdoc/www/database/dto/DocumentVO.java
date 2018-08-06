package com.taskdoc.www.database.dto;

import org.apache.ibatis.type.Alias;

@Alias("document")
public class DocumentVO {
	private int dmcode;
	private String dmtitle;
	private String dmcontents;
	private String dmdate;
	private String dmposition;
	private String crcode;
	private String tcode;
	private String uid;
	
	
	public int getDmcode() {
		return dmcode;
	}
	public void setDmcode(int dmcode) {
		this.dmcode = dmcode;
	}
	public String getDmtitle() {
		return dmtitle;
	}
	public void setDmtitle(String dmtitle) {
		this.dmtitle = dmtitle;
	}
	public String getDmcontents() {
		return dmcontents;
	}
	public void setDmcontents(String dmcontents) {
		this.dmcontents = dmcontents;
	}
	public String getDmdate() {
		return dmdate;
	}
	public void setDmdate(String dmdate) {
		this.dmdate = dmdate;
	}
	public String getDmposition() {
		return dmposition;
	}
	public void setDmposition(String dmposition) {
		this.dmposition = dmposition;
	}
	public String getCrcode() {
		return crcode;
	}
	public void setCrcode(String crcode) {
		this.crcode = crcode;
	}
	public String getTcode() {
		return tcode;
	}
	public void setTcode(String tcode) {
		this.tcode = tcode;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
}
