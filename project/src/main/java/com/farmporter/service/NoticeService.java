package com.farmporter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmporter.dao.INoticeRepository;
import com.farmporter.model.NoticeVO;

@Service
public class NoticeService implements INoticeService {

	@Autowired
	INoticeRepository noticeRepository;
	
	@Override
	public List<NoticeVO> getNoticeList(){
		return noticeRepository.getNoticeList();
	}
	@Override
	public NoticeVO getNoticeInfo(int noticeNo) {
		return noticeRepository.getNoticeInfo(noticeNo);
	}
	
	@Override
	public void insertNotice(NoticeVO notice) {
		noticeRepository.insertNotice(notice);	
	}
	
   @Override
   public void deleteNotice(int noticeNo) {
	   noticeRepository.deleteNotice(noticeNo);
   }
}
