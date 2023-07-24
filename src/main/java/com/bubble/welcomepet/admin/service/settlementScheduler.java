package com.bubble.welcomepet.admin.service;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.bubble.welcomepet.admin.mapper.AdminSqlMapper;
import com.bubble.welcomepet.dto.BizDto;

import com.bubble.welcomepet.dto.StatementDto;

@Service
@EnableScheduling
public class settlementScheduler {

	@Autowired
	private AdminSqlMapper adminSqlMapper;

	// @Scheduled(fixedDelay = 1000)
	// @Scheduled(cron = "0 0 0 1 * *") // 실제 코드
	//@Scheduled(cron = "0 0/1 * * * *") // 테스트
	public void test() {
		// ... 모든 biz 다 끌고와서...
		List<BizDto> bizList = adminSqlMapper.getAllBiz();
		LocalDate date = LocalDate.now();
		LocalDate issueDate = date.minusMonths(1);
		for (BizDto bizDto : bizList) {
			int biz_no = bizDto.getBiz_no();
			int total_sales = adminSqlMapper.getTotalSale(biz_no); // 판매자별 이전달 총 매출액 
			int year = issueDate.getYear();
			int month = issueDate.getMonthValue();
			StatementDto statementDto = new StatementDto();
			if (total_sales < 500000) {
				int commission = 5; // 수수료 5%
				int statement_price = total_sales - (total_sales * commission / 100); // 정산금액
				statementDto.setBiz_no(biz_no);
				statementDto.setStatement_commission(commission);
				statementDto.setStatement_month(month);
				statementDto.setStatement_year(year);
				statementDto.setStatement_total_sales(total_sales);
				statementDto.setStatement_price(statement_price);
				adminSqlMapper.scheduleStatement(statementDto);
			} else if(total_sales < 1000000) {
				int commission = 10; // 수수료 10%
				int statement_price = total_sales - (total_sales * commission / 100); // 정산금액
				statementDto.setBiz_no(biz_no);
				statementDto.setStatement_commission(commission);
				statementDto.setStatement_month(month);
				statementDto.setStatement_year(year);
				statementDto.setStatement_total_sales(total_sales);
				statementDto.setStatement_price(statement_price);
				adminSqlMapper.scheduleStatement(statementDto);
			} else {
				int commission = 15; // 수수료 15%
				int statement_price = total_sales - (total_sales * commission / 100); // 정산금액
				statementDto.setBiz_no(biz_no);
				statementDto.setStatement_commission(commission);
				statementDto.setStatement_month(month);
				statementDto.setStatement_year(year);
				statementDto.setStatement_total_sales(total_sales);
				statementDto.setStatement_price(statement_price);
				adminSqlMapper.scheduleStatement(statementDto);
			}
		}
	}
}