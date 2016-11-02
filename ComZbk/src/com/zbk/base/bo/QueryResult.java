package com.zbk.base.bo;


import java.util.List;

public class QueryResult<T> {

	public static int PageSize = 20;

	private int pageSize;//一页显示多少数据  前端可给
	private int pageNum;//第几页   前端可给
	private int resultAmount;//结果总数
	private int pageAmount;//共几页
	private List<T> result;

	public QueryResult() {
		this.pageNum = 1;
		this.pageSize = PageSize;
	}

	public int getPageAmount() {
		if (this.pageSize == 0) {
			this.pageAmount = 1;
		} else {
			if (this.pageAmount == 0) {
				//整除时，余数为零
				if (this.resultAmount % this.pageSize == 0) {
					//没有余数时，取整
					this.pageAmount = this.resultAmount / this.pageSize;
				} else {
					//有余数时，取整+1
					this.pageAmount = this.resultAmount / this.pageSize + 1;
				}
			}
		}
		return this.pageAmount;
	}

	public List<T> getResult() {
		return this.result;
	}

	public void setResult(List<T> result) {
		this.result = result;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		if (pageSize < 0) {
			this.pageSize = 0;
		} else {
			this.pageSize = pageSize;
		}
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getResultAmount() {
		return resultAmount;
	}

	public void setResultAmount(int resultAmount) {
		this.resultAmount = resultAmount;
	}

	public void setPageAmount(int pageAmount) {
		this.pageAmount = pageAmount;
	}

	@Override
	public String toString() {
		return "QueryResult [pageSize=" + pageSize + ", pageNum=" + pageNum
		        + ", resultAmount=" + resultAmount + ", pageAmount="
		        + pageAmount + "]";
	}
}
