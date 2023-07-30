package com.bubble.welcomepet.customer.service;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bubble.welcomepet.customer.mapper.CustomerMapper;
import com.bubble.welcomepet.customer.mapper.CustomerSqlMapper;
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

@Service
public class CustomerService {

	@Autowired
	private CustomerMapper customerMapper;

	// 고객
	
	public void registCustomer(CustomerDto customerDto) {
		int customerPk = customerMapper.createCustomerPk();
		customerDto.setCustomer_no(customerPk);
		customerMapper.registCustomer(customerDto);
	}

	public CustomerDto loginCustomer(CustomerDto customerDto) {

		CustomerDto customerLoginInfo = customerMapper.loginCustomerByIdAndPw(customerDto);
		return customerLoginInfo;
	}

	public CustomerDto getCustomerInfo(int customer_no) {

		CustomerDto customerInfo = customerMapper.getCustomerInfoByNo(customer_no);
		return customerInfo;
	}

	public CustomerDto updateCustomerInfo(CustomerDto customerDto) {
		customerMapper.updateCustomerInfo(customerDto);
		return customerDto;
	}
	
	public boolean existsCustomerId(String customerId) {
		
		int count = customerMapper.checkCustomerId(customerId);
		
		if(count > 0) {
			return true;
		}else {
			return false;
		}
	}
	

	// 주소

	public List<Map<String, Object>> getCustomerAddress(int customer_no) {

		List<CustomerAddressDto> CustomerAddressList = customerMapper.getCustomerAddress(customer_no);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		for (CustomerAddressDto customerAddressDto : CustomerAddressList) {
			Map<String, Object> map = new HashMap<>();
			map.put("customerAddressInfo", customerAddressDto);
			list.add(map);
		}
		return list;
	}
	public CustomerAddressDto mainAddress(int customer_no) {
		CustomerAddressDto mainAddress = customerMapper.mainAddress(customer_no);
		return mainAddress;
	}

	public void addAddress(CustomerAddressDto customerAddressDto) {
		int customer_no = customerAddressDto.getCustomer_no();
		if (customerMapper.mainAddress(customer_no) == null) {
			customerAddressDto.setCustomer_address_default(1);
			customerMapper.addCustomerAddress(customerAddressDto);
		}
		else {customerMapper.addCustomerAddress(customerAddressDto); } 
	}

	public CustomerAddressDto getAddressByAddressNo(int address_no) {
		CustomerAddressDto addressInfo = customerMapper.getAddressByAddressNo(address_no);
		return addressInfo;
	}

	public CustomerAddressDto updateCustomerAddress(CustomerAddressDto customerAddressDto) {
		customerMapper.updateCustomerAddress(customerAddressDto);
		return customerAddressDto;
	}
	
	public CustomerAddressDto updateMainAddress(CustomerAddressDto customerAddressDto) {
		customerMapper.updateMainAddress(customerAddressDto);
		return customerAddressDto;
	}
	


	// 반려견

	public void registDog(DogDto dogDto) {
		customerMapper.registDog(dogDto);
	}

	public List<Map<String, Object>> getDogByCutomerNo(int customer_no) {

		List<DogDto> DogList = customerMapper.getDogByCutomerNo(customer_no);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		for (DogDto dogDto : DogList) {
			Map<String, Object> map = new HashMap<>();
			map.put("dogInfo", dogDto);
			list.add(map);
		}
		return list;
	}		
	
	
	
	// 찜
	public void toggleWish(ProductWishDto productWishDto) {
		if(customerMapper.countMyWish(productWishDto) > 0) {
		customerMapper.deleteWish(productWishDto);	
		}
		else {
			customerMapper.addWish(productWishDto);	
		}
	}
	public boolean isWished(ProductWishDto productWishDto) {
		return customerMapper.countMyWish(productWishDto) > 0;
	}
	public int getTotalWishCount(int product_no) {
		return customerMapper.getTotalWishCount(product_no);
	}

	public List<Map<String, Object>> getWishList(int customer_no) {

		List<ProductWishDto> wishList = customerMapper.getWishList(customer_no);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		for (ProductWishDto productWishDto : wishList) {
			int product_no = productWishDto.getProduct_no();
			
			
			ProductDto productDto = customerMapper.getProductInfoByNo(product_no);
			
		    List<ProductReviewDto> reviewList = customerMapper.getProductReview(product_no);
		    int totalRating = 0;
		    int ratingCount = 0;
		    for (ProductReviewDto productReviewDto : reviewList) {
		        int rating = productReviewDto.getProduct_review_rating();
		        totalRating += rating;
		        ratingCount++;
		    }

		    double aveRating = (double) totalRating / ratingCount;
		    DecimalFormat df = new DecimalFormat("#.#");
		    String formattedAveRating = df.format(aveRating);
		    
			List<ProductOptionDto> productOptionList = customerMapper.getProductOptionByNo(product_no);
			double saleRate = (double) (productDto.getProduct_discount_rate()) / 100;
			int salePrice = (int) ((productDto.getProduct_price()) * saleRate);
			Map<String, Object> map = new HashMap<>();    
		    map.put("aveRating", Double.parseDouble(formattedAveRating));
		    map.put("ratingCount", ratingCount);
			map.put("optionList", productOptionList);
			map.put("salePrice", salePrice);
			map.put("productInfo", productDto);
			map.put("wishInfo", productWishDto);
			list.add(map);
		}
		return list;
	}
	

	// 장바구니

	public List<Map<String, Object>> getCartByCutomerNo(int customer_no) {

		List<CartDto> CartList = customerMapper.getCartByCutomerNo(customer_no);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		for (CartDto cartdto : CartList) {
			int product_option_no = cartdto.getProduct_option_no();
			ProductOptionDto productOptionDto = customerMapper.getOptionInfoByNo(product_option_no);
			int product_no = productOptionDto.getProduct_no();
			ProductDto productDto = customerMapper.getProductInfoByNo(product_no);
			double saleRate = (double) (productDto.getProduct_discount_rate()) / 100;
			int salePrice = (int) ((productOptionDto.getProduct_option_price()) * saleRate);
			Map<String, Object> map = new HashMap<>();
			map.put("productOptionInfo", productOptionDto);
			map.put("salePrice", salePrice);
			map.put("productInfo", productDto);
			map.put("cartInfo", cartdto);
			list.add(map);
		}
		return list;
	}
	
	public void addCart(CartDto cartdto) {
		customerMapper.addCart(cartdto);
	}

	public void deleteCart(int cart_no) {
		customerMapper.deleteCart(cart_no);
	}

	// 검색

	public List<Map<String, Object>> getSearchByCutomerNo(int customer_no) {

		List<CustomerSearchDto> SearchList = customerMapper.getSearchByCutomerNo(customer_no);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		for (CustomerSearchDto customerSearchDto : SearchList) {
			Map<String, Object> map = new HashMap<>();
			map.put("searchInfo", customerSearchDto);
			list.add(map);
		}
		return list;
	}
	
	public List<Map<String, Object>> searchProduct(String searchWord) {
		List<ProductDto> productList = customerMapper.searchProduct(searchWord);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		for (ProductDto productDto : productList) {
			int product_no = productDto.getProduct_no();
			
		    List<ProductReviewDto> reviewList = customerMapper.getProductReview(product_no);
		    int totalRating = 0;
		    int ratingCount = 0;
		    for (ProductReviewDto productReviewDto : reviewList) {
		        int rating = productReviewDto.getProduct_review_rating();
		        totalRating += rating;
		        ratingCount++;
		    }

		    double aveRating = (double) totalRating / ratingCount;
		    DecimalFormat df = new DecimalFormat("#.#");
		    String formattedAveRating = df.format(aveRating);
			
			double saleRate = (double) (productDto.getProduct_discount_rate()) / 100;

			int salePrice = (int) ((productDto.getProduct_price()) * saleRate);
			Map<String, Object> map = new HashMap<>();
		    map.put("aveRating", Double.parseDouble(formattedAveRating));
		    map.put("ratingCount", ratingCount);
			map.put("salePrice", salePrice);
			map.put("productInfo", productDto);
			list.add(map);
		}
		return list;
	}

	public void addSearch(CustomerSearchDto customerSearchDto) {
		customerMapper.addCustomerSearch(customerSearchDto);
	}
	

	// 상품
	
	public Map<String, Object> getProductbyOption(int product_option_no) {
		Map<String,Object> map = new HashMap<>();
		ProductOptionDto productOptionDto = customerMapper.getOptionInfoByNo(product_option_no);
		int product_no = productOptionDto.getProduct_no();
		ProductDto productDto = customerMapper.getProductInfoByNo(product_no);
		
		double saleRate = (double) (productDto.getProduct_discount_rate()) / 100;

		int salePrice = (int) ((productOptionDto.getProduct_option_price()) * saleRate);
		map.put("optionInfo", productOptionDto);
		map.put("salePrice", salePrice);
		map.put("productInfo", productDto);
		return map;
	}
	
	
	public Map<String, Object> getByProductNo(int product_no) {
		Map<String,Object> map = new HashMap<>();
		ProductDto productDto = customerMapper.getProductInfoByNo(product_no);
		List<ProductDetailImageDto> productImgList = customerMapper.getImgByProductNo(product_no);
		List<ProductOptionDto> productOptionList = customerMapper.getProductOptionByNo(product_no);
		double saleRate = (double) (productDto.getProduct_discount_rate()) / 100;
		int biz_no = productDto.getBiz_no();
		BizDto bizDto = customerMapper.getBizInfoByBizNo(biz_no);
		int sub_category_no =  productDto.getSub_category_no();
		int main_category_no = customerMapper.getMaincategoryNoBySub(sub_category_no);
		int salePrice = (int) ((productDto.getProduct_price()) * saleRate);
		map.put("bizInfo", bizDto);
		map.put("categoryNo", main_category_no);
		map.put("optionList", productOptionList);
		map.put("salePrice", salePrice);
		map.put("productImgList", productImgList);
		map.put("productInfo", productDto);
		return map;
	}
	
	public List<Map<String, Object>> getProductInfoByBiz(int biz_no) {

		List<ProductDto> productList = customerMapper.getProductInfoByBiz(biz_no);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		for (ProductDto productDto : productList) {
			
			int product_no = productDto.getProduct_no();
			
		    List<ProductReviewDto> reviewList = customerMapper.getProductReview(product_no);
		    int totalRating = 0;
		    int ratingCount = 0;
		    for (ProductReviewDto productReviewDto : reviewList) {
		        int rating = productReviewDto.getProduct_review_rating();
		        totalRating += rating;
		        ratingCount++;
		    }

		    double aveRating = (double) totalRating / ratingCount;
		    DecimalFormat df = new DecimalFormat("#.#");
		    String formattedAveRating = df.format(aveRating);
			
			double saleRate = (double) (productDto.getProduct_discount_rate()) / 100;

			int salePrice = (int) ((productDto.getProduct_price()) * saleRate);
			Map<String, Object> map = new HashMap<>();
		    map.put("aveRating", Double.parseDouble(formattedAveRating));
		    map.put("ratingCount", ratingCount);
			map.put("salePrice", salePrice);
			map.put("productInfo", productDto);
			list.add(map);
		}
		return list;
	}
	

	public List<Map<String, Object>> getProductInfoByMainCategory(Integer main_category_no) {

		List<ProductDto> productList = customerMapper.getProductInfoByMainCategory(main_category_no);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		for (ProductDto productDto : productList) {
			
			int product_no = productDto.getProduct_no();
			
		    List<ProductReviewDto> reviewList = customerMapper.getProductReview(product_no);
		    int totalRating = 0;
		    int ratingCount = 0;
		    for (ProductReviewDto productReviewDto : reviewList) {
		        int rating = productReviewDto.getProduct_review_rating();
		        totalRating += rating;
		        ratingCount++;
		    }

		    double aveRating = (double) totalRating / ratingCount;
		    DecimalFormat df = new DecimalFormat("#.#");
		    String formattedAveRating = df.format(aveRating);
			
			double saleRate = (double) (productDto.getProduct_discount_rate()) / 100;

			int salePrice = (int) ((productDto.getProduct_price()) * saleRate);
			Map<String, Object> map = new HashMap<>();
		    map.put("aveRating", Double.parseDouble(formattedAveRating));
		    map.put("ratingCount", ratingCount);
			map.put("salePrice", salePrice);
			map.put("productInfo", productDto);
			list.add(map);
		}
		return list;
	}

	public List<Map<String, Object>> getProductInfoByCategory(Integer sub_category_no) {

		List<ProductDto> productList = customerMapper.getProductInfoByCategory(sub_category_no);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		for (ProductDto productDto : productList) {
			
			int product_no = productDto.getProduct_no();
			
		    List<ProductReviewDto> reviewList = customerMapper.getProductReview(product_no);
		    int totalRating = 0;
		    int ratingCount = 0;
		    for (ProductReviewDto productReviewDto : reviewList) {
		        int rating = productReviewDto.getProduct_review_rating();
		        totalRating += rating;
		        ratingCount++;
		    }

		    double aveRating;
		    if (ratingCount == 0) {
		        aveRating = 0.0;
		    } else {
		        aveRating = (double) totalRating / ratingCount;
		    }

		    double aveRatingValue = Math.round(aveRating * 10) / 10.0;
		    
			double saleRate = (double) (productDto.getProduct_discount_rate()) / 100;
			

			int salePrice = (int) ((productDto.getProduct_price()) * saleRate);
			Map<String, Object> map = new HashMap<>();
		    map.put("aveRating", aveRatingValue);
		    map.put("ratingCount", ratingCount);
			map.put("salePrice", salePrice);
			map.put("productInfo", productDto);
			list.add(map);
		}
		return list;
	}

	public CategoryDto getSubCategory(int sub_category_no) {
		CategoryDto categoryDto = customerMapper.getSubCategory(sub_category_no);
		return categoryDto;
	}

	public CategoryDto getMainCategory(int main_category_no) {
		CategoryDto categoryDto = customerMapper.getMainCategory(main_category_no);
		return categoryDto;
	}

	public List<Map<String, Object>> getSubCategoryByMain(Integer main_category_no) {

		List<CategoryDto> categoryList = customerMapper.getSubCategoryByMainCategory(main_category_no);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		for (CategoryDto categoryDto : categoryList) {
			
			Map<String, Object> map = new HashMap<>();
			map.put("categoryDto", categoryDto);
			list.add(map);
		}
		return list;
		

	}

	public List<Map<String, Object>> topSaleProduct() {

		List<ProductDto> productList = customerMapper.topSaleProduct();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		for (ProductDto productDto : productList) {
			
			int product_no = productDto.getProduct_no();
			
		    List<ProductReviewDto> reviewList = customerMapper.getProductReview(product_no);
		    int totalRating = 0;
		    int ratingCount = 0;
		    for (ProductReviewDto productReviewDto : reviewList) {
		        int rating = productReviewDto.getProduct_review_rating();
		        totalRating += rating;
		        ratingCount++;
		    }

		    double aveRating = (double) totalRating / ratingCount;
		    DecimalFormat df = new DecimalFormat("#.#");
		    String formattedAveRating = df.format(aveRating);
		    
			double saleRate = (double) (productDto.getProduct_discount_rate()) / 100;

			int salePrice = (int) ((productDto.getProduct_price()) * saleRate);
			Map<String, Object> map = new HashMap<>();
		    map.put("aveRating", Double.parseDouble(formattedAveRating));
		    map.put("ratingCount", ratingCount);
			map.put("salePrice", salePrice);
			map.put("productInfo", productDto);
			list.add(map);
		}
		return list;
	}
	
	public List<Map<String, Object>> getbizList() {
		
		List<BizDto> bizList = customerMapper.getBizList();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		for(BizDto bizDto : bizList) {
			
			Map<String, Object> map = new HashMap<>();
			
			map.put("bizInfo", bizDto);
			list.add(map);
		}
		return list;
	}
	
	
	
	
	//주문
	
	public int addOrders(OrdersDto ordersDto,  List<OrderProductDto> orderProductDtoList) {
		int orders_no = customerMapper.createOrdersPk();
		ordersDto.setOrders_no(orders_no);

		customerMapper.AddOrders(ordersDto);
		
	    for (OrderProductDto orderProductDto : orderProductDtoList) {
	    	
	    	int product_option_no = orderProductDto.getProduct_option_no();
	    	int order_product_no = customerMapper.createOrderProductPk();
			ProductOptionDto productOptionDto = customerMapper.getOptionInfoByNo(product_option_no);
			int product_no = productOptionDto.getProduct_no();
			ProductDto productDto = customerMapper.getProductInfoByNo(product_no);
			int biz_no = productDto.getBiz_no();
			OrderAlarmDto orderAlarmDto = new OrderAlarmDto();
			orderAlarmDto.setBiz_no(biz_no);
			orderAlarmDto.setOrder_product_no(order_product_no);
			customerMapper.addOrderAlarm(orderAlarmDto);
			orderProductDto.setOrder_product_no(order_product_no);
	        orderProductDto.setOrders_no(orders_no);
	        customerMapper.AddOrderProduct(orderProductDto);
	    }
	    
	    return  orders_no;
	}

	
	
	public List<Map<String, Object>> getCustomerOrders(int customer_no) {
		
		List<OrdersDto> orderList = customerMapper.getCustomerOrder(customer_no);
		List<Map<String, Object>> orderDetailsList  = new ArrayList<Map<String, Object>>();
		
		for (OrdersDto ordersDto : orderList) {
			 int orders_no = ordersDto.getOrders_no();
			List<OrderProductDto> orderProductList = customerMapper.getOrderProduct(orders_no);
			
			 for(OrderProductDto orderProductDto :orderProductList ) {
				 int product_option_no = orderProductDto.getProduct_option_no();
				 ProductOptionDto  productOptionDto = customerMapper.getOptionInfoByNo(product_option_no);
				 int product_no = productOptionDto.getProduct_no();
				 int product_status_no = orderProductDto.getOrder_product_status_no();
				 String status_name = customerMapper.getProductStatus(product_status_no);
				 orderProductDto.setOrder_product_status_name(status_name);
				 ProductDto productDto = customerMapper.getProductInfoByNo(product_no);
			        orderProductDto.setProduct(productDto); // OrderProductDto에 ProductDto 설정
			        orderProductDto.setProduct_option(productOptionDto); 				 
			 }
			 
			Map<String, Object> map = new HashMap<>();
			map.put("orderDto", ordersDto);
			map.put("orderProductList", orderProductList);
			orderDetailsList.add(map);
		}
		return orderDetailsList;
		
	} 
	
	public OrdersDto getOrder(int orders_no) {
		OrdersDto ordersDto = customerMapper.getOrderByNo(orders_no);
		return ordersDto;
	}
	
	public Map<String, Object> getOrderProduct(int order_product_no) {
		Map<String,Object> map = new HashMap<>();
		OrderProductDto orderProductDto = customerMapper.getOrderProductByNo(order_product_no);
		int orders_no = orderProductDto.getOrders_no();
		int product_option_no = orderProductDto.getProduct_option_no();
		OrdersDto ordersDto = customerMapper.getOrderByNo(orders_no);
		ProductOptionDto productOptionDto = customerMapper.getOptionInfoByNo(product_option_no);
		int product_no = productOptionDto.getProduct_no();
		ProductDto productDto = customerMapper.getProductInfoByNo(product_no);
		map.put("orderProductDto", orderProductDto);
		map.put("ordersDto", ordersDto);
		map.put("productOptionDto", productOptionDto);
		map.put("productDto", productDto);
		return map;
	}
	
	public List<Map<String, Object>> orderDetails(int orders_no) {
	    List<OrderProductDto> orderProductList = customerMapper.getOrderProduct(orders_no);
	    List<Map<String, Object>> list = new ArrayList<>();
	  
	    for (OrderProductDto orderProductDto : orderProductList) {
	    	
	    	
	        int product_option_no = orderProductDto.getProduct_option_no();
	        ProductOptionDto productOptionDto = customerMapper.getOptionInfoByNo(product_option_no);
	        int product_no = productOptionDto.getProduct_no();
	        ProductDto productDto = customerMapper.getProductInfoByNo(product_no);

			
	        Map<String, Object> map = new HashMap<>();

	        map.put("orderProductDto", orderProductDto);
	        map.put("productOptionDto", productOptionDto);
	        map.put("productDto", productDto);
	        list.add(map);
	    }

	    return list;
	}
	

	
	public Map<String, Integer> calculateTotal(int orders_no) {
	    List<OrderProductDto> orderProductList = customerMapper.getOrderProduct(orders_no);
	    int totalUsedPoint = 0;
	    int totalSalePrice = 0;
	    int totalPrice = 0 ;
	    int highestDeliveryFee = 0;

	    for (OrderProductDto orderProductDto : orderProductList) {
	        int used_point = orderProductDto.getOrder_product_used_point();
	        
	        totalUsedPoint += used_point;
	        	
	        int product_option_no = orderProductDto.getProduct_option_no();
	        ProductOptionDto productOptionDto = customerMapper.getOptionInfoByNo(product_option_no);
	        int option_price = productOptionDto.getProduct_option_price();
	        totalPrice += option_price;
	        int product_no = productOptionDto.getProduct_no();
	        ProductDto productDto = customerMapper.getProductInfoByNo(product_no);
	        double saleRate = (double) (productDto.getProduct_discount_rate()) / 100;
	        int salePrice = (int) ((productOptionDto.getProduct_option_price()) * saleRate);
	        totalSalePrice += salePrice;
	        
	        int deliveryFee = productDto.getProduct_shipping_price();
	        
	        if (deliveryFee > highestDeliveryFee) {
	            highestDeliveryFee = deliveryFee;
	        }
	    }
	    
	    System.out.println(totalSalePrice);
	    int saleRate = (int)(((double) (totalSalePrice + totalUsedPoint) / totalPrice) * 100);

	    Map<String, Integer> totals = new HashMap<>();
	    System.out.println(saleRate);
	    totals.put("saleRate", saleRate);
	    totals.put("totalPrice", totalPrice);
	    totals.put("totalSalePrice", totalSalePrice);
	    totals.put("totalUsedPoint", totalUsedPoint);
	    totals.put("highestDeliveryFee", highestDeliveryFee);

	    return totals;
	}
	
	
	
	public void updateProductStatus(OrderProductDto orderProductDto) {
		customerMapper.updateProductStatus(orderProductDto);
		
	}
	
	
	// 리뷰
	
	public void writeReview(ProductReviewDto productReviewDto, List<ProductReviewImagesDto> ReviewImgList) {
		 
		int product_review_no = customerMapper.createReviewPk();
		
		productReviewDto.setProduct_review_no(product_review_no);
		customerMapper.writeReview(productReviewDto);
		
		for(ProductReviewImagesDto reviewImgDto : ReviewImgList) {
			
			reviewImgDto.setProduct_review_no(product_review_no);
			customerMapper.uploadReviewImg(reviewImgDto);
		}
	}
	
	public void deleteReview(int product_review_no) {
		customerMapper.deleteReview(product_review_no);
	}
	
	public void updateReview(ProductReviewDto productReviewDto) {
		customerMapper.updateReview(productReviewDto);
	}

	public List<Map<String, Object>> getReviewByCustomer(int customer_no) {

		List<ProductReviewDto> reviewList = customerMapper.getCustomerReview(customer_no);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		for (ProductReviewDto productReviewDto : reviewList) {
			int product_review_no = productReviewDto.getProduct_review_no();
			int product_option_no = productReviewDto.getProduct_option_no();
			ProductOptionDto productOptionDto = customerMapper.getOptionInfoByNo(product_option_no);
			int product_no = productOptionDto.getProduct_no();
			ProductDto productDto = customerMapper.getProductInfoByNo(product_no);
			List<ProductReviewImagesDto> reviewImgList = customerMapper.getReviewImg(product_review_no);
			Map<String, Object> map = new HashMap<>();
			map.put("productDto", productDto);
			map.put("productOptionDto", productOptionDto);
			map.put("reviewImgList", reviewImgList);
			map.put("productReviewDto", productReviewDto);
			list.add(map);
		}
		return list;
	}
	
	
	public List<Map<String, Object>> getReviewByProduct(int product_no) {

		List<ProductReviewDto> reviewList = customerMapper.getProductReview(product_no);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		for (ProductReviewDto productReviewDto : reviewList) {
			int product_review_no = productReviewDto.getProduct_review_no();
			int product_option_no = productReviewDto.getProduct_option_no();
			int customer_no = productReviewDto.getCustomer_no();
			
			CustomerDto customerDto = customerMapper.getCustomerInfoByNo(customer_no);
			ProductOptionDto productOptionDto = customerMapper.getOptionInfoByNo(product_option_no);
			ProductDto productDto = customerMapper.getProductInfoByNo(product_no);
			List<ProductReviewImagesDto> reviewImgList = customerMapper.getReviewImg(product_review_no);
			Map<String, Object> map = new HashMap<>();
			map.put("customerDto", customerDto);
			map.put("productDto", productDto);
			map.put("productOptionDto", productOptionDto);
			map.put("reviewImgList", reviewImgList);
			map.put("productReviewDto", productReviewDto);
			list.add(map);
		}
		return list;
	}
	
	public List<Map<String, Object>> getCategoryList(int main_category_no) {
		
		List<CategoryDto> categoryList = customerMapper.getCategoryList(main_category_no);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		for(CategoryDto categoryDto : categoryList) {
			Map<String, Object> map = new HashMap<>();
			map.put("categoryList", categoryDto);
			list.add(map);
		}
		return list;
	}
	
	public void addRecentProduct (RecentProductDto recentProductDto) {
		
		customerMapper.addRecentProduct(recentProductDto);
	}
	
	public List<Map<String, Object>> getRecentProductByCutomerNo(int customer_no) {

		List<RecentProductDto> recentProductList = customerMapper.getRecentProductList(customer_no);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		for (RecentProductDto recentProductDto : recentProductList) {
			
			int product_no = recentProductDto.getProduct_no();
			ProductDto productDto = customerMapper.getProductInfoByNo(product_no);
			
		    List<ProductReviewDto> reviewList = customerMapper.getProductReview(product_no);
		    int totalRating = 0;
		    int ratingCount = 0;
		    for (ProductReviewDto productReviewDto : reviewList) {
		        int rating = productReviewDto.getProduct_review_rating();
		        totalRating += rating;
		        ratingCount++;
		    }

		    double aveRating = (double) totalRating / ratingCount;
		    DecimalFormat df = new DecimalFormat("#.#");
		    String formattedAveRating = df.format(aveRating);
			
			double saleRate = (double) (productDto.getProduct_discount_rate()) / 100;
			int salePrice = (int) ((productDto.getProduct_price()) * saleRate);
			Map<String, Object> map = new HashMap<>();
		    map.put("aveRating", Double.parseDouble(formattedAveRating));
		    map.put("ratingCount", ratingCount);
			map.put("salePrice", salePrice);
			map.put("productInfo", productDto);
			map.put("recentInfo", recentProductDto);
			list.add(map);
		}
		return list;
	}
	
	public String recentProductImg(int customer_no) {
		
		RecentProductDto recentproductDto = customerMapper.getRecentProduct(customer_no);
		
		int product_no = recentproductDto.getProduct_no();
		
		ProductDto productDto = customerMapper.getProductInfoByNo(product_no);
		
		String productImg = productDto.getProduct_thumbnail();

		
		return productImg;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
