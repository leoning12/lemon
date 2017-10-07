package com.lemon.base.util;

import java.util.List;

public class PageResult<T> {
	// 记录总数
	private int total;
	// 结果集
	private List<T> rows;

	public PageResult(int total, List<T> rows) {
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

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}

}
