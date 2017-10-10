package com.lemon.base.util;

import java.util.List;

public class PageResult {
	// 记录总数
	private int total;
	// 结果集
	private List rows;

	public PageResult(int total, List rows) {
		super();
		this.total = total;
		this.rows = rows;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public List getRows() {
		return rows;
	}

	public void setRows(List rows) {
		this.rows = rows;
	}

}
