package com.taskdoc.www.database.dto;

import org.apache.ibatis.type.Alias;

@Alias("memo")
public class memoVO {
	private int mcode;
	private int ptcode;
	private String mcontents;
	private String mdate;
}
