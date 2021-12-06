package com.ssafy.happyhouse.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "Restaurant : Restaurant 정보", description = "Restaurant 상세 정보를 나타낸다.")
public class Restaurant {
	
	@ApiModelProperty(value = "가게 이름")
	private String entrp_nm;
	@ApiModelProperty(value = "도로명 주소")
	private String load_addr;
	@ApiModelProperty(value = "경도")
	private String xpos_lo;
	@ApiModelProperty(value = "위도")
	private String ypos_la;
	@ApiModelProperty(value = "지역 이름")
	private String area_nm;
	@ApiModelProperty(value = "전화번호")
	private String tel_no;
	@ApiModelProperty(value = "메뉴 가격")
	private String menu_pc;
	@ApiModelProperty(value = "대표 메뉴")
	private String represent_menu;
	
	public String getEntrp_nm() {
		return entrp_nm;
	}
	public void setEntrp_nm(String entrp_nm) {
		this.entrp_nm = entrp_nm;
	}
	public String getLoad_addr() {
		return load_addr;
	}
	public void setLoad_addr(String load_addr) {
		this.load_addr = load_addr;
	}
	public String getXpos_lo() {
		return xpos_lo;
	}
	public void setXpos_lo(String xpos_lo) {
		this.xpos_lo = xpos_lo;
	}
	public String getYpos_la() {
		return ypos_la;
	}
	public void setYpos_la(String ypos_la) {
		this.ypos_la = ypos_la;
	}
	public String getArea_nm() {
		return area_nm;
	}
	public void setArea_nm(String area_nm) {
		this.area_nm = area_nm;
	}
	public String getTel_no() {
		return tel_no;
	}
	public void setTel_no(String tel_no) {
		this.tel_no = tel_no;
	}
	public String getMenu_pc() {
		return menu_pc;
	}
	public void setMenu_pc(String menu_pc) {
		this.menu_pc = menu_pc;
	}
	public String getRepresent_menu() {
		return represent_menu;
	}
	public void setRepresent_menu(String represent_menu) {
		this.represent_menu = represent_menu;
	}

	
}
