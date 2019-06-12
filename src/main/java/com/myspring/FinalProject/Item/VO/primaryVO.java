package com.myspring.FinalProject.Item.VO;


import org.springframework.stereotype.Component;

@Component("primaryVO")
public class primaryVO {
//기본정보
private String authNum;	//authNum
private String autoNum; //자동 번호
private String itemAddr; //소재지 
private String itemBuild; //건물명 
private String itemWidth; //면적
private String itemLayer; //해당층
private String total_Layer; // 총 층수
private String itemParking; //주차가능대수
private String itemPay; //관리비
private String itemYear; //입주 연
private String itemMonth; //입주 월
private String itemDay; //입주 일


//가격 정보
private String deposit; //보증금
private String itemPrice; //itemSelect에 대한 가격
private String itemSelect; //매매,전세,월세
private String business; //취급 업소 (중개사무소 명)
private String explain; //설명
//사진 정보
private String loadMap; //지도

public String getAuthNum() {
	return authNum;
}
public void setAuthNum(String authNum) {
	this.authNum = authNum;
}
public String getAutoNum() {
	return autoNum;
}
public void setAutoNum(String autoNum) {
	this.autoNum = autoNum;
}
public String getItemAddr() {
	return itemAddr;
}
public void setItemAddr(String itemAddr) {
	this.itemAddr = itemAddr;
}
public String getItemBuild() {
	return itemBuild;
}
public void setItemBuild(String itemBuild) {
	this.itemBuild = itemBuild;
}
public String getItemWidth() {
	return itemWidth;
}
public void setItemWidth(String itemWidth) {
	this.itemWidth = itemWidth;
}
public String getItemLayer() {
	return itemLayer;
}
public void setItemLayer(String itemLayer) {
	this.itemLayer = itemLayer;
}
public String getTotal_Layer() {
	return total_Layer;
}
public void setTotal_Layer(String total_Layer) {
	this.total_Layer = total_Layer;
}
public String getItemParking() {
	return itemParking;
}
public void setItemParking(String itemParking) {
	this.itemParking = itemParking;
}
public String getItemPay() {
	return itemPay;
}
public void setItemPay(String itemPay) {
	this.itemPay = itemPay;
}

public String getDeposit() {
	return deposit;
}
public void setDeposit(String deposit) {
	this.deposit = deposit;
}
public String getItemPrice() {
	return itemPrice;
}
public void setItemPrice(String itemPrice) {
	this.itemPrice = itemPrice;
}
public String getItemSelect() {
	return itemSelect;
}
public void setItemSelect(String itemSelect) {
	this.itemSelect = itemSelect;
}
public String getBusiness() {
	return business;
}
public void setBusiness(String business) {
	this.business = business;
}
public String getExplain() {
	return explain;
}
public void setExplain(String explain) {
	this.explain = explain;
}
public String getLoadMap() {
	return loadMap;
}
public void setLoadMap(String loadMap) {
	this.loadMap = loadMap;
}

public primaryVO() {
}
public String getItemYear() {
	return itemYear;
}
public void setItemYear(String itemYear) {
	this.itemYear = itemYear;
}
public String getItemMonth() {
	return itemMonth;
}
public void setItemMonth(String itemMonth) {
	this.itemMonth = itemMonth;
}
public String getItemDay() {
	return itemDay;
}
public void setItemDay(String itemDay) {
	this.itemDay = itemDay;
}
public primaryVO(String authNum, String autoNum, String itemAddr, String itemBuild, String itemWidth, String itemLayer,
		String total_Layer, String itemParking, String itemPay, String itemYear, String itemMonth, String itemDay,
		String deposit, String itemPrice, String itemSelect, String business, String explain, String loadMap) {
	this.authNum = authNum;
	this.autoNum = autoNum;
	this.itemAddr = itemAddr;
	this.itemBuild = itemBuild;
	this.itemWidth = itemWidth;
	this.itemLayer = itemLayer;
	this.total_Layer = total_Layer;
	this.itemParking = itemParking;
	this.itemPay = itemPay;
	this.itemYear = itemYear;
	this.itemMonth = itemMonth;
	this.itemDay = itemDay;
	this.deposit = deposit;
	this.itemPrice = itemPrice;
	this.itemSelect = itemSelect;
	this.business = business;
	this.explain = explain;
	this.loadMap = loadMap;
}
}