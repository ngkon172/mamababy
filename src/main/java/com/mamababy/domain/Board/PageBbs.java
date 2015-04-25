package com.mamababy.domain.Board;

import java.util.List;

public class PageBbs {
	private NavigationInfo navInfo = new NavigationInfo();
	private List<Bbs> bbs;

	public NavigationInfo getNavInfo() {
		return navInfo;

	}

	public void setNavInfo(NavigationInfo navInfo) {
		this.navInfo = navInfo;
	}

	public List<Bbs> getBbs() {
		return bbs;
	}

	public void setBbs(List<Bbs> bbs) {
		this.bbs = bbs;
	}

	public Bbs getBbs(int i) {
		return bbs.get(i);
	}

	public void setBbs(int i, Bbs bbs) {
		this.bbs.add(i, bbs);
	}

}
