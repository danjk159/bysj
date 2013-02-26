package pageBean;

import java.util.ArrayList;
import java.util.Iterator;

import entitys.Documents;

public class PBDocuments {

	int currentPage = 1;// 当前页

	public int totalPages = 0;// 总页数

	int pageRecorders = 7;// 每页10条数据

	int totalRows = 0;// 总数据数

	int pageStartRow = 0;// 每页的起始数

	int pageEndRow = 0;// 每页显示数据的终止数

	boolean hasNextPage = false; // 是否有下一页

	boolean hasPreviousPage = false; // 是否有前一页
	
	ArrayList arrayList;

	Iterator it;

	public String sort_id;
	
	String strInfo="文档";
	String strUrl="DocumentManage";
	
	public PBDocuments() {
	}


	public PBDocuments(ArrayList arrayList, String pass_sort_id) {
		this.sort_id = pass_sort_id;
		this.arrayList = arrayList;
		totalRows = arrayList.size();// 取得总记录数
		it = arrayList.iterator();
		hasPreviousPage = false; // 是否有前一页
		currentPage = 1; // 当前页为第一页
		if ((totalRows % pageRecorders) == 0) {// 总条数除于一页显示条数,得到是否有余页,还是刚好多少页
			totalPages = totalRows / pageRecorders;// 如果没有余的话就真好多少页
		} else {
			totalPages = totalRows / pageRecorders + 1;// 如果有余的话,就会多出一页,加1
		}

		if (currentPage >= totalPages) {// 如果当前页大于等于总页数
			hasNextPage = false;// 下一页不显示
		} else {
			hasNextPage = true;// 不大于或等于下一页,显示下一页
		}

		if (totalRows < pageRecorders) {// 总行数小于每页显示的条数
			this.pageStartRow = 0;// 每页的起始数为0
			this.pageEndRow = totalRows;// 第一页就结束了,为总行数
		} else {
			this.pageStartRow = 0;// 每页的起始数为0
			this.pageEndRow = pageRecorders;// 每页结束为每页多少行
		}

	}

	public String getSort_id() {
		return sort_id;
	}

	public void setSort_id(String sort_id) {
		this.sort_id = sort_id;
	}

	/**
	 * @return Returns the currentPage.
	 */
	public String getCurrentPage() {
		return this.toString(currentPage);
	}

	/**
	 * @param currentPage
	 *            The currentPage to set.
	 */
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	/**
	 * @return Returns the pageRecorders.
	 */
	public int getPageRecorders() {
		return pageRecorders;
	}

	/**
	 * @param pageRecorders
	 *            The pageRecorders to set.
	 */
	public void setPageRecorders(int pageRecorders) {
		this.pageRecorders = pageRecorders;
	}

	/**
	 * @return Returns the pageEndRow.
	 */
	public int getPageEndRow() {
		return pageEndRow;
	}

	/**
	 * @return Returns the pageStartRow.
	 */
	public int getPageStartRow() {
		return pageStartRow;
	}

	/**
	 * @return Returns the totalPages.
	 */
	public String getTotalPages() {

		return this.toString(totalPages);
	}

	/**
	 * @return Returns the totalRows.
	 */
	public String getTotalRows() {
		return this.toString(totalRows);
	}

	/**
	 * @return Returns the hasNextPage.
	 */
	public boolean isHasNextPage() {
		return hasNextPage;
	}

	/**
	 * @param hasNextPage
	 *            The hasNextPage to set.
	 */
	public void setHasNextPage(boolean hasNextPage) {
		this.hasNextPage = hasNextPage;
	}

	/**
	 * @return Returns the hasPreviousPage.
	 */
	public boolean isHasPreviousPage() {
		return hasPreviousPage;
	}

	/**
	 * @param hasPreviousPage
	 *            The hasPreviousPage to set.
	 */
	public void setHasPreviousPage(boolean hasPreviousPage) {
		this.hasPreviousPage = hasPreviousPage;
	}

	public Documents[] getNextPage() {

		currentPage = currentPage + 1;// 当前页加上一页,到下一页

		if ((currentPage - 1) > 0) {// 如果下一页前去1
			hasPreviousPage = true;
		} else {
			hasPreviousPage = false;
		}
		if (currentPage >= totalPages) {
			hasNextPage = false;
		} else {
			hasNextPage = true;
		}

		Documents[] nsList = getUsList();
		this.description();// 打印相对页面信息
		return nsList;// 返回这个数组
	}

	public Documents[] getPreviousPage() {
		currentPage = currentPage - 1;

		if (currentPage == 0) {// 如果为每一页,设为第一页
			currentPage = 1;
		}

		if (currentPage >= totalPages) {// 如果当前页大于总数，下一页为false,反为true
			hasNextPage = false;
		} else {
			hasNextPage = true;
		}
		if ((currentPage - 1) > 0) {// 如果在已前进了上一页，如果总页数减去一页，如果大于0则上一页为true
			hasPreviousPage = true;
		} else {
			hasPreviousPage = false;
		}
		Documents[] nsList = getUsList();
		this.description();// 打印相对页面信息
		return nsList;// 返回这个数组
	}

	public Documents[] getFristPage() {

		currentPage = 1;// 当前页加上一页,到下一页

		if ((currentPage - 1) > 0) {// 如果下一页前去1
			hasPreviousPage = true;
		} else {
			hasPreviousPage = false;
		}
		if (currentPage >= totalPages) {
			hasNextPage = false;
		} else {
			hasNextPage = true;
		}

		Documents[] nsList = getUsList();
		this.description();// 打印相对页面信息
		return nsList;// 返回这个数组
	}

	public Documents[] getListPage() {

		currentPage = totalPages;// 当前页加上一页,到下一页

		if ((currentPage - 1) > 0) {// 如果下一页前去1
			hasPreviousPage = true;
		} else {
			hasPreviousPage = false;
		}
		if (currentPage >= totalPages) {
			hasNextPage = false;
		} else {
			hasNextPage = true;
		}

		Documents[] nsList = getUsList();
		this.description();// 打印相对页面信息
		return nsList;// 返回这个数组
	}

	public Documents[] getPostPage(int post) {

		currentPage = post;// 当前页加上一页,到下一页

		if ((currentPage - 1) > 0) {// 如果下一页前去1
			hasPreviousPage = true;
		} else {
			hasPreviousPage = false;
		}
		if (currentPage >= totalPages) {
			hasNextPage = false;
		} else {
			hasNextPage = true;
		}

		Documents[] nsList = getUsList();
		this.description();// 打印相对页面信息
		return nsList;// 返回这个数组
	}

	public Documents[] getUsList() {

		if (currentPage * pageRecorders < totalRows) {// 判断是否为最后一页,当前页*每页多少行,如果小于总行数
			pageEndRow = currentPage * pageRecorders;// 当前页得到的要显示的页数乘以每页显示的行数,得到总行数,结束的行数
			pageStartRow = pageEndRow - pageRecorders;// 得到的总行数减去一页数,得到起始页的指针id
		} else {
			pageEndRow = totalRows;// 如果当前页的数量已大于总行数,则结束的行数为总行数
			pageStartRow = pageRecorders * (totalPages - 1);// 起始的行数为总页数减于一页的总数
		}
		Documents[] books = new Documents[pageEndRow - pageStartRow + 1];// 定义一个数组为最后一条的指针减去最后一页开始的指针,得到要装多少条数据

		int j = 0;
		for (int i = pageStartRow; i < pageEndRow; i++) {// 循环得到数组中的指针对应的中间几条数据
			Documents book = (Documents) arrayList.get(i);// 生成得到的几个数据循环填充数据到Documents中,这儿将生成相对应我多个Documents对象
			books[j++] = book;// 将对像加入准备好的数组中

		}

		this.description();// 打印相对页面信息
		return books;// 返回这个数组
	}

	public String toString(int temp) {
		String str = Integer.toString(temp);
		return str;
	}

	public void description() {
		/*String description = "共有数据数:" + this.getTotalRows() + "共有页数: " +
		  this.getTotalPages() + "当前页数为:" + this.getCurrentPage() + " 是否有前一页: "
		  + this.isHasPreviousPage() + " 是否有下一页:" + this.isHasNextPage() +
		  " 开始行数:" + this.getPageStartRow() + " 终止行数:" + this.getPageEndRow();*/
		 

	}

	public String getDescriptionsip(String searchName) {
		String description = "共 <B> " + this.getTotalRows() + "</B> 个"
				+ strInfo + "  ";
		if (this.isHasPreviousPage()) {
			description = description + " <a href='" + strUrl
					+ "?page=1&searchName="+searchName+"'>首页</a>";

		} else {
			description = description + " 首页";
		}

		if (this.isHasPreviousPage()) {
			description = description + " <a href='" + strUrl
					+ "?page="+(currentPage-1)+"&searchName="+searchName+"'>上一页</a>";

		} else {
			description = description + " 上一页";
		}
		if (this.isHasNextPage()) {
			description = description + " <a href='" + strUrl
					+ "?page="+(currentPage+1)+"&searchName="+searchName+"'>下一页</a>";

		} else {
			description = description + " 下一页";
		}
		if (this.isHasNextPage()) {
			description = description + " <a href='" + strUrl
					+ "?page="+(getTotalPages())+"&searchName="+searchName+"'>尾页</a>";

		} else {
			description = description + " 尾页";
		}
		description = description + "  页次： <STRONG> <FONT color='#ff0000'>"
				+ this.getCurrentPage() + "</FONT> / " + this.getTotalPages()
				+ " </STRONG> 页";
		description = description + " <B> " + this.getPageRecorders()
				+ " </B> 个" + strInfo + "/页 ";
		description = description
				+ " 转到： <select name='page' size='1' onchange=javascript:window.location='"
				+ strUrl + "?searchName="+searchName+"&page='+this.options[this.selectedIndex].value;>";
		for (int i = 1; i <= Integer.parseInt(this.getTotalPages()); i++) {
			description = description + "<option value='" + i + "'";
			if (this.getCurrentPage().equals("" + i)) {
				description = description + " selected ";
			}
			description = description + ">第" + i + "页</option>";

		}
		description = description + "</select>";
		return description;
	}
}