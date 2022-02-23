package com.farmporter.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	//메인 페이지 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void mainPageGET() {		
		logger.info("메인 페이지 진입");		
	}
	
	@RequestMapping(value= {"/farm_sites"})
	public String farmSites(Model model) {
		logger.info("귀농 관련 사이트 페이지 진입");	
		return "farm_sites";
	}

	@RequestMapping(value= {"/intro"})
	public String intro(Model model) {
		logger.info("소개 페이지 진입");			
		return "intro";
	}
	
	@RequestMapping(value= {"/profit_crop"})
	public String profitCrop(Model model) {
		logger.info("소득정보 - 식량작물 진입");	
		return "profit_crop";		
	}
	
	@RequestMapping(value= {"/profit_fruit"})
	public String profitFruit(Model model) {
		logger.info("소득정보 - 과수 진입");	
		return "profit_fruit";		
	}
	
	@RequestMapping(value= {"/profit_vegi_fac"})
	public String profitVegiFac(Model model) {
		logger.info("소득정보 - 시설채소 진입");	
		return "profit_vegi_fac";
	}
	
	@RequestMapping(value= {"/profit_vegi_wild"})
	public String profitVegiWild(Model model) {
		logger.info("소득정보 - 노지채소 진입");	
		return "profit_vegi_wild";		
	}
	
	@RequestMapping(value= {"/predict"})
	public String predict(Model model) {
		logger.info("농산물 가격 예측 진입");	
		return "predict";		
	}
	
    @RequestMapping(value= {"/cost_comparison"})
    public String costComparison(Model model) {
    	logger.info("도시/농촌 지출 비교 진입");	
    	return "cost_comparison";    	
    }
    
    @RequestMapping(value= {"/farmer_profit"})
    public String farmerProfit(Model model) {
    	logger.info("농가수입/소득 진입");	
    	return "farmer_profit";    	
    }
    
    @RequestMapping(value= {"/gov_land_cost"})
    public String govLandCost(Model model) {
    	logger.info("정부지원금/농지가격 진입");	
    	return "gov_land_cost";    	
    }
    
    @RequestMapping(value= {"/loan_settle_cost"})
    public String loanSettleCost(Model model) {
    	logger.info("정착 자금/대출 진입");	
    	return "loan_settle_cost";    	
    }
}
