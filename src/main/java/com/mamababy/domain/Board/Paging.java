package com.mamababy.domain.Board;

public class Paging {
	private int firstPage;
	private int lastPage;
	private int prevLink;
	private int nextLink;
	private int startRecord;
	private int endRecord;
	private int listNo;

	public int getFirstPage() {
		return firstPage;
	}

	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getPrevLink() {
		return prevLink;
	}

	public void setPrevLink(int prevLink) {
		this.prevLink = prevLink;
	}

	public int getNextLink() {
		return nextLink;
	}

	public void setNextLink(int nextLink) {
		this.nextLink = nextLink;
	}

	public int getStartRecord() {
		return startRecord;
	}

	public void setStartRecord(int startRecord) {
		this.startRecord = startRecord;
	}

	public int getEndRecord() {
		return endRecord;
	}

	public void setEndRecord(int endRecord) {
		this.endRecord = endRecord;
	}

	public int getListNo() {
		return listNo;
	}

	public void setListNo(int listNo) {
		this.listNo = listNo;
	}

	public int[] getPageLinks() {
		return pageLinks;
	}

	public void setPageLinks(int[] pageLinks) {
		this.pageLinks = pageLinks;
	}

	private int[] pageLinks;

	public Paging(int totalRecord, int curPage, int numPerPage, int pagePerBlock) {

		int totalPage = ((totalRecord % numPerPage) == 0) ? totalRecord
				/ numPerPage : totalRecord / numPerPage + 1;
		int totalBlock = ((totalPage % pagePerBlock) == 0) ? totalPage
				/ pagePerBlock : totalPage / pagePerBlock + 1;
		int block = ((curPage % pagePerBlock) == 0) ? curPage / pagePerBlock
				: curPage / pagePerBlock + 1;
		this.firstPage = (block - 1) * pagePerBlock + 1;
		this.lastPage = block * pagePerBlock;
		if (block >= totalBlock) {
			this.lastPage = totalPage;
		}
		pageLinks = makeArray(firstPage, lastPage);

		if (block > 1) {
			this.prevLink = firstPage - 1;
		}
		if (block < totalBlock) {
			this.nextLink = lastPage + 1;
		}
		this.listNo = totalRecord - (curPage - 1) * numPerPage;
		this.startRecord = (curPage - 1) * numPerPage + 1;
		this.endRecord = startRecord + numPerPage - 1;
	}

	private int[] makeArray(int first, int last) {
		int size = last - first + 1;
		int[] ret = new int[size];
		for (int i = 0; i < size; i++) {
			ret[i] = first++;
		}
		return ret;
	}
}
