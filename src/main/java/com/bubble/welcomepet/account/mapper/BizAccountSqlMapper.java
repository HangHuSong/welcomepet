package com.bubble.welcomepet.account.mapper;

import java.util.List;

import com.bubble.welcomepet.dto.BankDto;
import com.bubble.welcomepet.dto.BizAccountDto;

public interface BizAccountSqlMapper {

	public List<BankDto> getAllBank();

	public void createBizAccount(BizAccountDto bizAccountDto);

	public List<BizAccountDto> getBizAccountByBizNo(int biz_no);

	public BankDto getBankByNo(int bank_no);

	public BizAccountDto getBizAccountByNo(int biz_account_no);


	public int createBizAccountPk();


}
