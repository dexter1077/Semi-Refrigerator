package com.refrigerator.recipe.model.vo;

/**
 * @author HeeRak
 */
public class Recipe {
	
	private int recipeNo;
	private int userNo;
	private String recipeWriter; // recipeWriter 성은 추가 
	private String recipeTitle;
	private String recipeIntro;
	private int severalServings; 
	private int cookingTime;
	private double avrgStarPoint; 	
	private int count;
	private int likeCount;
	private int scrapCount;
	private String recipeEnrollDate;
	private String status;
	private String mainImg;
	private String ingreImg;
	
	public Recipe() {}
	
	public Recipe(int userNo, String recipeTitle, String recipeIntro, int severalServings, int cookingTime, String mainImg,
			String ingreImg) {
		super();
		this.userNo = userNo;
		this.recipeTitle = recipeTitle;
		this.recipeIntro = recipeIntro;
		this.severalServings = severalServings;
		this.cookingTime = cookingTime;
		this.mainImg = mainImg;
		this.ingreImg = ingreImg;
	}

	public Recipe(int recipeNo, int userNo, String recipeWriter, String recipeTitle, String recipeIntro,
			int severalServings, int cookingTime, double avrgStarPoint, int count, int likeCount, int scrapCount,
			String recipeEnrollDate, String status, String mainImg, String ingreImg) {
		super();
		this.recipeNo = recipeNo;
		this.userNo = userNo;
		this.recipeWriter = recipeWriter;
		this.recipeTitle = recipeTitle;
		this.recipeIntro = recipeIntro;
		this.severalServings = severalServings;
		this.cookingTime = cookingTime;
		this.avrgStarPoint = avrgStarPoint;
		this.count = count;
		this.likeCount = likeCount;
		this.scrapCount = scrapCount;
		this.recipeEnrollDate = recipeEnrollDate;
		this.status = status;
		this.mainImg = mainImg;
		this.ingreImg = ingreImg;
	}

	public Recipe(int recipeNo, int userNo, String recipeWriter, String recipeTitle, String recipeIntro,
			double avrgStarPoint, int count, String recipeEnrollDate, String mainImg) {
		super();
		this.recipeNo = recipeNo;
		this.userNo = userNo;
		this.recipeWriter = recipeWriter;
		this.recipeTitle = recipeTitle;
		this.recipeIntro = recipeIntro;
		this.avrgStarPoint = avrgStarPoint;
		this.count = count;
		this.recipeEnrollDate = recipeEnrollDate;
		this.mainImg = mainImg;
	}
	
	/** 메인페이지 - 조회수 내림차순 레시피 조회용
	 * @author daeun 
	 */
	public Recipe(int recipeNo, String recipeTitle, String recipeWriter, int count, String recipeEnrollDate, String mainImg) {
		super();
		this.recipeNo = recipeNo;
		this.recipeTitle = recipeTitle;
		this.recipeWriter = recipeWriter;
		this.count = count;
		this.recipeEnrollDate = recipeEnrollDate;
		this.mainImg = mainImg;
	}
	
	/***
	 * 레시피 상세페이지 조회
	 * @author seong
	 * @date 6/3
	 */

	public Recipe(int recipeNo, String recipeWriter, String recipeTitle, String recipeIntro, int severalServings,
			int cookingTime, double avrgStarPoint, int count, int scrapCount, String recipeEnrollDate, String mainImg,
			String ingreImg) {
		super();
		this.recipeNo = recipeNo;
		this.recipeWriter = recipeWriter;
		this.recipeTitle = recipeTitle;
		this.recipeIntro = recipeIntro;
		this.severalServings = severalServings;
		this.cookingTime = cookingTime;
		this.avrgStarPoint = avrgStarPoint;
		this.count = count;
		this.scrapCount = scrapCount;
		this.recipeEnrollDate = recipeEnrollDate;
		this.mainImg = mainImg;
		this.ingreImg = ingreImg;
	}
	
	public Recipe(int recipeNo, String recipeWriter, String recipeTitle, double avrgStarPoint, int count,
			String recipeEnrollDate, String mainImg) {
		super();
		this.recipeNo = recipeNo;
		this.recipeWriter = recipeWriter;
		this.recipeTitle = recipeTitle;
		this.avrgStarPoint = avrgStarPoint;
		this.count = count;
		this.recipeEnrollDate = recipeEnrollDate;
		this.mainImg = mainImg;
	}
	
	

	public Recipe(int recipeNo, String recipeTitle, double avrgStarPoint, int count, String mainImg) {
		super();
		this.recipeNo = recipeNo;
		this.recipeTitle = recipeTitle;
		this.avrgStarPoint = avrgStarPoint;
		this.count = count;
		this.mainImg = mainImg;
	}

	
	public Recipe(int recipeNo, String recipeWriter, String recipeTitle, double avrgStarPoint, int count,
			String mainImg) {
		super();
		this.recipeNo = recipeNo;
		this.recipeWriter = recipeWriter;
		this.recipeTitle = recipeTitle;
		this.avrgStarPoint = avrgStarPoint;
		this.count = count;
		this.mainImg = mainImg;
	}

	/** 마이페이지 내가쓴레시피 조회해온것 담아오는것 
	 * @author Jaewon
	 */
	public Recipe(int recipeNo, String recipeWriter, String recipeTitle, double avrgStarPoint, int count,
			int scrapCount, String recipeEnrollDate, String mainImg) {
		super();
		this.recipeNo = recipeNo;
		this.recipeWriter = recipeWriter;
		this.recipeTitle = recipeTitle;
		this.avrgStarPoint = avrgStarPoint;
		this.count = count;
		this.scrapCount = scrapCount;
		this.recipeEnrollDate = recipeEnrollDate;
		this.mainImg = mainImg;
	}
	
	
	/** 레시피 정보 모두 가져오기위한 매개변수 생성자 (레시피 작성자 아이디 제외) 
	 * @author Jaewon
	 */
	public Recipe(int recipeNo, int userNo, String recipeTitle, String recipeIntro, int severalServings,
			int cookingTime, double avrgStarPoint, int count, int likeCount, int scrapCount, String recipeEnrollDate,
			String status, String mainImg, String ingreImg) {
		super();
		this.recipeNo = recipeNo;
		this.userNo = userNo;
		this.recipeTitle = recipeTitle;
		this.recipeIntro = recipeIntro;
		this.severalServings = severalServings;
		this.cookingTime = cookingTime;
		this.avrgStarPoint = avrgStarPoint;
		this.count = count;
		this.likeCount = likeCount;
		this.scrapCount = scrapCount;
		this.recipeEnrollDate = recipeEnrollDate;
		this.status = status;
		this.mainImg = mainImg;
		this.ingreImg = ingreImg;
	}
	
	/** 메인페이지 - 레시피 정보 조회
	 * @author daeun 
	 */
	public Recipe(int recipeNo, String recipeWriter, String recipeTitle, int count, int likeCount) {
		super();
		this.recipeNo = recipeNo;
		this.recipeWriter = recipeWriter;
		this.recipeTitle = recipeTitle;
		this.count = count;
		this.likeCount = likeCount;
		
	}
	
	public Recipe(int recipeNo, String recipeTitle, String recipeWriter, int count, String mainImg) {
		super();
		this.recipeNo = recipeNo;
		this.recipeTitle = recipeTitle;
		this.recipeWriter = recipeWriter;
		this.count = count;
		this.mainImg = mainImg;
	}
	
	public Recipe(int recipeNo, String recipeTitle, String recipeWriter, String mainImg, int likeCount) {
		super();
		this.recipeNo = recipeNo;
		this.recipeTitle = recipeTitle;
		this.recipeWriter = recipeWriter;
		this.count = likeCount;
		this.mainImg = mainImg;
	}

	public int getRecipeNo() {
		return recipeNo;
	}

	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getRecipeTitle() {
		return recipeTitle;
	}

	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}

	public String getRecipeIntro() {
		return recipeIntro;
	}

	public void setRecipeIntro(String recipeIntro) {
		this.recipeIntro = recipeIntro;
	}

	public int getSeveralServings() {
		return severalServings;
	}

	public void setSeveralServings(int severalServings) {
		this.severalServings = severalServings;
	}

	public int getCookingTime() {
		return cookingTime;
	}

	public void setCookingTime(int cookingTime) {
		this.cookingTime = cookingTime;
	}

	public double getAvrgStarPoint() {
		return avrgStarPoint;
	}

	public void setAvrgStarPoint(double avrgStarPoint) {
		this.avrgStarPoint = avrgStarPoint;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getScrapCount() {
		return scrapCount;
	}

	public void setScrapCount(int scrapCount) {
		this.scrapCount = scrapCount;
	}

	public String getRecipeEnrollDate() {
		return recipeEnrollDate;
	}

	public void setRecipeEnrollDate(String recipeEnrollDate) {
		this.recipeEnrollDate = recipeEnrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMainImg() {
		return mainImg;
	}

	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}

	public String getIngreImg() {
		return ingreImg;
	}

	public void setIngreImg(String ingreImg) {
		this.ingreImg = ingreImg;
	}

	public String getRecipeWriter() {
		return recipeWriter;
	}

	public void setRecipeWriter(String recipeWriter) {
		this.recipeWriter = recipeWriter;
	}

	@Override
	public String toString() {
		return "Recipe [recipeNo=" + recipeNo + ", userNo=" + userNo + ", recipeWriter=" + recipeWriter
				+ ", recipeTitle=" + recipeTitle + ", recipeIntro=" + recipeIntro + ", severalServings="
				+ severalServings + ", cookingTime=" + cookingTime + ", avrgStarPoint=" + avrgStarPoint + ", count="
				+ count + ", likeCount=" + likeCount + ", scrapCount=" + scrapCount + ", recipeEnrollDate="
				+ recipeEnrollDate + ", status=" + status + ", mainImg=" + mainImg + ", ingreImg=" + ingreImg + "]";
	}

	

}
