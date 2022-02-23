package com.farmporter.dao;

import java.util.List;
import java.util.Map;

import com.farmporter.model.UserVO;
import com.farmporter.model.WpriceVO;


public interface IWpriceRepository {

	List<WpriceVO> getWorldPrice();

	}
