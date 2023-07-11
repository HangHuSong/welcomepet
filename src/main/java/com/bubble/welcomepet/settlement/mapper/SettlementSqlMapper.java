package com.bubble.welcomepet.settlement.mapper;

import java.util.Date;
import java.util.List;

import com.bubble.welcomepet.dto.SettlementProcessDto;
import com.bubble.welcomepet.dto.SettlementRequestDto;
import com.bubble.welcomepet.dto.StatementDto;

public interface SettlementSqlMapper {

	public void createSettlementRequest(SettlementRequestDto settlementRequestDto);

	public List<StatementDto> getStatementListByBizNo(int biz_no);

	public SettlementRequestDto getSettlementRequestByStatementNo(int statement_no);

	public SettlementProcessDto getSettlememtProcessBySettlementRequestNo(int settlement_request_no);

	public int createSettlementPk();

	public SettlementProcessDto getSettlementByOrdersDate(String formattedDate);

}
