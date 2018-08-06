package com.taskdoc.www.database.dto;

import org.apache.ibatis.type.Alias;

@Alias("sample")	// 해당명이 mybatis 에 참조됨.
public class sample {
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
