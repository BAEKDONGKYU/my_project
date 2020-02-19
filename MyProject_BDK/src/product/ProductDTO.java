package product;

import java.sql.Timestamp;

public class ProductDTO {
	private String p_num;  // 제품번호 
	private String p_name; // 제품명
	private String p_category; // 제품 카테고리
	private int p_price;  // 제품 가격
	private Timestamp p_date;  //제품 입고 날짜
	private int p_count; // 제품 수량
	private int p_total_count; // 제품 총 판매량 
	public String getP_num() {
		return p_num;
	}
	public void setP_num(String p_num) {
		this.p_num = p_num;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_category() {
		return p_category;
	}
	public void setP_category(String p_category) {
		this.p_category = p_category;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public Timestamp getP_date() {
		return p_date;
	}
	public void setP_date(Timestamp p_date) {
		this.p_date = p_date;
	}
	public int getP_count() {
		return p_count;
	}
	public void setP_count(int p_count) {
		this.p_count = p_count;
	}
	public int getP_total_count() {
		return p_total_count;
	}
	public void setP_total_count(int p_total_count) {
		this.p_total_count = p_total_count;
	}
		
}
