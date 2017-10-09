package com.lemon.base.util;

import java.util.List;

/** 
 * 分页功能中的一页的信息
 *  
 */  
public class PageBean {  
  
    // 指定的或是页面参数  
    private int pageNumber; // 当前页  
    private int pageSize; // 每页显示多少条  
  
    // 查询数据库  
    private int total; // 总记录数  
    private List rows; // 本页的数据列表  
  
    // 计算  
    private int pageCount; // 总页数  
    private int beginPageIndex; // 页码列表的开始索引（包含）  
    private int endPageIndex; // 页码列表的结束索引（包含）
    private int prev;// 前页 页号
    private int next;// 下一页 页号
  
    /** 
     * 只接受前4个必要的属性，会自动的计算出其他3个属生的值 
     *  
     * @param pageNumber 
     * @param pageSize 
     * @param total 
     * @param rows 
     */  
    public PageBean(int pageNumber, int pageSize, int total, List rows) {  
        this.pageNumber = pageNumber;  
        this.pageSize = pageSize;  
        this.total = total;  
        this.rows = rows;
  
        // 计算总页码  
        pageCount = (total + pageSize - 1) / pageSize;  
  
        // 计算 beginPageIndex 和 endPageIndex  
        // >> 总页数不多于10页，则全部显示  
        if (pageCount <= 10) {  
            beginPageIndex = 1;
            endPageIndex = pageCount;  
        }  
        // >> 总页数多于10页，则显示当前页附近的共10个页码  
        else {  
            // 当前页附近的共10个页码（前4个 + 当前页 + 后5个）  
            beginPageIndex = pageNumber - 4;  
            endPageIndex = pageNumber + 5;  
            // 当前面的页码不足4个时，则显示前10个页码  
            if (beginPageIndex < 1) {  
                beginPageIndex = 1;  
                endPageIndex = 10;  
            }  
            // 当后面的页码不足5个时，则显示后10个页码  
            if (endPageIndex > pageCount) {  
                endPageIndex = pageCount;  
                beginPageIndex = pageCount - 10 + 1;  
            }  
        }
        this.next = this.pageNumber<this.pageCount?this.pageNumber+1:this.endPageIndex;// Math.min(this.pageCount, this.pageNumber + 1);
        this.prev = this.pageNumber>1?this.pageNumber-1:this.beginPageIndex;// Math.max(1, this.pageNumber - 1);
    }  
  
    public List getRows() {  
        return rows;  
    }  
  
    public void setRows(List rows) {  
        this.rows = rows;  
    }  
  
    public int getPageNumber() {  
        return pageNumber;  
    }  
  
    public void setPageNumber(int pageNumber) {  
        this.pageNumber = pageNumber;  
    }  
  
    public int getPageCount() {  
        return pageCount;  
    }  
  
    public void setPageCount(int pageCount) {  
        this.pageCount = pageCount;  
    }  
  
    public int getPageSize() {  
        return pageSize;  
    }  
  
    public void setPageSize(int pageSize) {  
        this.pageSize = pageSize;  
    }  
  
    public int getTotal() {  
        return total;  
    }  
  
    public void setTotal(int total) {  
        this.total = total;  
    }  
  
    public int getBeginPageIndex() {  
        return beginPageIndex;  
    }  
  
    public void setBeginPageIndex(int beginPageIndex) {  
        this.beginPageIndex = beginPageIndex;  
    }  
  
    public int getEndPageIndex() {  
        return endPageIndex;  
    }  
  
    public void setEndPageIndex(int endPageIndex) {  
        this.endPageIndex = endPageIndex;  
    }

	public int getPrev() {
		return prev;
	}

	public void setPrev(int prev) {
		this.prev = prev;
	}

	public int getNext() {
		return next;
	}

	public void setNext(int next) {
		this.next = next;
	}  
  
}  
