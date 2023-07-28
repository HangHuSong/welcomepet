package com.bubble.welcomepet.customer.mapper;

import java.util.List;

import com.bubble.welcomepet.dto.BizDto;
import com.bubble.welcomepet.dto.CartDto;
import com.bubble.welcomepet.dto.CategoryDto;
import com.bubble.welcomepet.dto.CustomerAddressDto;
import com.bubble.welcomepet.dto.CustomerDto;
import com.bubble.welcomepet.dto.CustomerSearchDto;
import com.bubble.welcomepet.dto.DogDto;
import com.bubble.welcomepet.dto.OrderAlarmDto;
import com.bubble.welcomepet.dto.OrderProductDto;
import com.bubble.welcomepet.dto.OrdersDto;
import com.bubble.welcomepet.dto.ProductDto;
import com.bubble.welcomepet.dto.ProductDetailImageDto;
import com.bubble.welcomepet.dto.ProductOptionDto;
import com.bubble.welcomepet.dto.ProductReviewDto;
import com.bubble.welcomepet.dto.ProductWishDto;
import com.bubble.welcomepet.dto.RecentProductDto;
import com.bubble.welcomepet.dto.ProductReviewImagesDto;


public interface CustomerMapper {
	
	public int createCustomerPk();

	public void registCustomer(CustomerDto customerDto);
	
	public CustomerDto loginCustomerByIdAndPw(CustomerDto customerDto);
	
	public CustomerDto getCustomerInfoByNo(int customer_no);
	
	public void updateCustomerInfo(CustomerDto customerDto);
	
	public int checkCustomerId (String customer_id);

	
	// 주소 관련
	
	public List<CustomerAddressDto> getCustomerAddress(int customer_no);
	public CustomerAddressDto getAddressByAddressNo(int customer_address_no);
	public void addCustomerAddress(CustomerAddressDto customerAddressDto);
	public void updateCustomerAddress(CustomerAddressDto customerAddressDto);
	public CustomerAddressDto mainAddress(int customer_address_no);
	public void updateMainAddress(CustomerAddressDto customerAddressDto);
	
	// Dog
	public void registDog(DogDto dogDto);
	public List<DogDto> getDogByCutomerNo(int customer_no);
	
	// 검색
	public void addCustomerSearch(CustomerSearchDto customerSearchDto);
	public List<CustomerSearchDto> getSearchByCutomerNo(int customer_no);
	
	
	// 장바구니
	
	public List<CartDto> getCartByCutomerNo(int customer_no);
	
	public ProductDto getProductInfoByNo(int product_no); // 상품정보 
	
	public void deleteCart(int cart_no);

	public void addCart(CartDto cartDto);
	
	// 찜
	
	public void addWish(ProductWishDto productWishDto);
	
	public List<ProductWishDto> getWishList(int customer_no);
	
	public int countMyWish(ProductWishDto productWishDto); 
	public void deleteWish(ProductWishDto productWishDto);
	public int getTotalWishCount(int product_no);
	
	//상품
	public List<ProductDto> getProductInfoByCategory(int sub_category_no);
	
	public List<ProductDetailImageDto> getImgByProductNo(int product_no);
	
	public List<ProductDto> topSaleProduct();
	
	public List<ProductDto> getProductInfoByMainCategory(int main_category_no);
	
	public List<ProductDto> getProductInfoByBiz(int biz_no);
	
	public CategoryDto getSubCategory(int sub_category_no);
	
	public CategoryDto getMainCategory(int main_category_no);
	
	public List<CategoryDto> getSubCategoryByMainCategory(int main_category_no);
	
	public List<ProductDto> searchProduct(String searchWord);
	
	public List<ProductOptionDto> getProductOptionByNo(int product_no);
	
	public ProductOptionDto getOptionInfoByNo(int product_option_no);
	
	public List<CategoryDto> getCategoryList(int main_category_no);
	
	public int getMaincategoryNoBySub(int sub_category_no); 
	
	public List<BizDto> getBizList();
	
	public BizDto getBizInfoByBizNo(int biz_no);
	
	public void addRecentProduct(RecentProductDto recentProductDto);
	
	public List<RecentProductDto> getRecentProductList(int customer_no);
	
	public RecentProductDto getRecentProduct(int customer_no);
	//주문
	
	public int createOrdersPk();
	
	public void AddOrders(OrdersDto ordersDto);
	
	public void AddOrderProduct(OrderProductDto orderProductDto);
	
	public OrdersDto getOrderByNo(int orders_no);
	
	public List<OrdersDto> getCustomerOrder(int customer_no);
	
	public List<OrderProductDto> getOrderProduct(int orders_no);
	
	public String getProductStatus(int order_product_status_no);
	
	public void updateProductStatus(OrderProductDto orderProductDto);
	
	public OrderProductDto getOrderProductByNo(int order_product_no);
	
	public void addOrderAlarm(OrderAlarmDto orderAlarmDto);
	
	public int createOrderProductPk();
	
	// 리뷰
	public int createReviewPk();
	
	public void writeReview(ProductReviewDto productReviewDto);
	
	public void deleteReview(int product_review_no);
	
	public void updateReview(ProductReviewDto productReviewDto);
	
	public void uploadReviewImg(ProductReviewImagesDto reviewImgDto);
	
	public List<ProductReviewImagesDto> getReviewImg(int product_review_no);
	
	public List<ProductReviewDto> getCustomerReview(int customer_no);
	
	public List<ProductReviewDto> getProductReview(int product_no);
	
	


}

	


