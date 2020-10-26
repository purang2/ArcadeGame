package dao;

import dto.Picture;
import java.util.ArrayList;

// 숨은 그림 찾기에서 숨은 그림과 타겟을 저장되어있는 java
public class PictureRepository {

	private ArrayList<Picture> listOfPictures = new ArrayList<Picture>();		
	
	public PictureRepository() {
		Picture picture01 = new Picture();
		picture01.setStage(1);
		picture01.setPicture("picture01.jpg");
		picture01.setTargetPos(new String[] {"211,191,269,215", "77, 322, 113, 350", "112, 134, 137, 164", 
											"481, 149, 526, 164", "125, 89, 205, 108", "608, 71, 677, 102", 
											"157 , 329, 182 , 387", "294 ,130, 330, 153", "147 , 211, 198 , 229"});
		
		picture01.setTargetPictures(new String[] {"target_0101.jpg", "hiddenPictureImg/target_0102.jpg", "../resources/hiddenPictureImg/target_0103.jpg", 
				"../resources/hiddenPictureImg/target_0104.jpg", "../resources/hiddenPictureImg/target_0105.jpg", "../resources/hiddenPictureImg/target_0106.jpg", "../resources/hiddenPictureImg/target_0107.jpg", 
				"../resources/hiddenPictureImg/target_0108.jpg", "../resources/hiddenPictureImg/target_0109.jpg"});
		picture01.setAnswerPicture("../resources/hiddenPictureImg/picture01_A.jpg");

		/*
		picture01.setTargetPictures(new String[] {"target_0101.jpg", "target_0102.jpg", "target_0103.jpg", 
											"target_0104.jpg", "target_0105.jpg", "target_0106.jpg", "target_0107.jpg", 
											"target_0108.jpg", "target_0109.jpg"});
		picture01.setAnswerPicture("picture01_A.jpg");
		*/

		Picture picture02 = new Picture();
		picture02.setStage(2);
		picture02.setPicture("../resources/css/picture02.jpg");
		picture02.setTargetPos(new String[] {"43, 44, 145, 67", "274, 49, 327, 76", "371, 4, 440, 33", 
											"40, 206, 89, 229", "421, 305, 485,332", "356 ,153, 435 ,168", 
											"340, 362, 416, 397", " 570, 213, 687, 237", "189,  0, 214 , 69"});
		picture02.setTargetPictures(new String[] {"target_0201.jpg", "target_0202.jpg", "target_0203.jpg", 
											"target_0204.jpg", "target_0205.jpg", "target_0206.jpg", "target_0207.jpg",
											"target_0208.jpg", "target_0209.jpg"});
		picture02.setAnswerPicture("picture02_A.jpg");

		Picture picture03 = new Picture();
		picture03.setStage(3);
		picture03.setPicture("picture03.jpg");
		picture03.setTargetPos(new String[] {"112 , 239, 208, 260", "304 , 32, 370 , 81", "0, 9 , 76, 48",
											"372, 108, 425, 142", "134,3,  170, 65", "624, 265,  673,337", 
											"499, 213, 546, 241", "1 , 187, 50 , 225", "468 , 37, 610 , 57"});
		picture03.setTargetPictures(new String[] {"target_0301.jpg", "target_0302.jpg", "target_0303.jpg", 
											"target_0304.jpg", "target_0305.jpg", "target_0306.jpg", "target_0307.jpg",
											"target_0308.jpg", "target_0309.jpg"});
		picture03.setAnswerPicture("picture03_A.jpg");

		Picture picture04 = new Picture();
		picture04.setStage(4);
		picture04.setPicture("picture04.jpg");
		picture04.setTargetPos(new String[] {"44, 25, 175, 43", "216, 137, 277, 186", "618, 141, 651,177",
											"267, 358, 303, 398", "177, 121, 256, 142", "420, 145,  462, 198", 
											"469, 62, 532, 114", "381, 91,  451, 129", "195, 306, 263, 346"});
		picture04.setTargetPictures(new String[] {"target_0401.jpg", "target_0402.jpg", "target_0403.jpg", 
											"target_0404.jpg", "target_0405.jpg", "target_0406.jpg", "target_0407.jpg", 
											"target_0408.jpg", "target_0409.jpg"});
		picture04.setAnswerPicture("picture04_A.jpg");

		listOfPictures.add(picture01);
		listOfPictures.add(picture02);
		listOfPictures.add(picture03);
		listOfPictures.add(picture04);
	}

	
	private static PictureRepository instance = new PictureRepository();

	public static PictureRepository getInstance() {
		return instance;
	}
	
	public int getSizeOfList(){
		return this.listOfPictures.size();
	}
	
	public Picture getPictureByStage(int stage) {
			Picture pictureByStage = null;
		
		for (int i = 0;i<listOfPictures.size();i++) {
			Picture picture = listOfPictures.get(i);
			if (picture != null && picture.getStage() != 0 && picture.getStage() == stage) {
				pictureByStage = picture;
				break;
			}
		}
		return pictureByStage;
	}	
}
