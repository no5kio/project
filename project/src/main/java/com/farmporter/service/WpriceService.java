package com.farmporter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmporter.dao.IWpriceRepository;
import com.farmporter.model.WpriceVO;

@Service
public class WpriceService implements IWpriceService {
	
	@Autowired
	IWpriceRepository wpriceRepository;
	
	@Override
	public List<WpriceVO> getWorldPrice() {
		return wpriceRepository.getWorldPrice();
	}
}
