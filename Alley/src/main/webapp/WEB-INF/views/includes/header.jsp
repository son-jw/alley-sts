<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="format-detection" content="telephone=no" />
<meta name="baidu-site-verification" content="M9qjBhZly2" />

<meta name="subject" content="백종원의 골목식당: oo골목, 도시 찾기">
<meta name="description" content="솔직하고 거짓없는 리뷰로 나만의 맛집을 쉽고 빠르게 찾아보세요!">
<meta name="keywords" content="서울, 부천, 인천, 포방터, 이화여대 , 서대문구">

<title>먹거리 - 먹보들의 거리 리뷰: 백종원의 골목 식당</title>

<link rel="stylesheet" media="screen" href="../resources/assets/dist/NewFile.css" />

<link rel="shortcut icon" href="../resources/assets/favicon.ico">


<header class="Header " data-page="normal">
  <a href="/"
     class="Header__Logo"
     onclick="trackEvent('CLICK_HEADER_LOGO');">
    <i class="Header__LogoIcon"></i>
  </a>

  <div class="Header__SearchBox">
    <i class="Header__SearchIcon"></i>

    <label class="Header__SearchInputWrap">
      <input type="text" class="Header__SearchInput" placeholder="지역, 또는 회차" value="" autocomplete="off" maxlength="50"/>
    </label>

    <button class="Header__SearchInputClearButton">CLEAR</button>
  </div>

  <ul class="Header__MenuList">
      <li class="Header__MyMenu">
        <a href="/MyMenu"
           class="Header__MenuLink"
           onclick="trackEvent('CLICK_MY_MENU')">
          <span class="Header__MenuText">마이메뉴</span>
        </a>
      </li>

    <li class="Header__MenuItem">
      <a href="/alley_reserve"
         class="Header__MenuLink"
         onclick="trackEvent('CLICK_ALLEY_RESERVE')">
        <span class="Header__MenuText">예약하기</span>
      </a>
    </li>

    <li class="Header__MenuItem">
      <a href="/MY_zzim"
         class="Header__MenuLink"
         onclick="trackEvent('CLICK_MY_ZZIM')">
        <span class="Header__MenuText">찜리스트</span>
      </a>
    </li>
  </ul>

  <ul class="Header__IconButtonList">
    <li class="Header__IconButtonItem only-mobile Header__IconButtonItem--MenuButton">
      <button class="MenuButton"
              onclick="trackEvent('CLICK_MENU');">
        <i class="MenuButton__Icon"></i>
      </button>
    </li>

    <li class="Header__IconButtonItem Header__IconButtonItem--UserRestaurantHistory">
      <button class="UserProfileButton"
              onclick="trackEvent('CLICK_PROFILE');">
        <i class="UserProfileButton__Picture"></i>
        <i class="UserProfileButton__PersonIcon"></i>
        <span class="UserProfileButton__HistoryCount">0</span>
      </button>
    </li>

    <li class="Header__IconButtonItem Header__IconButtonItem--CloseButton Header__IconButtonItem--Hide">
      <button class="Header__CloseButton"></button>
    </li>
  </ul>
</header>

<div class="KeywordSuggester">
  <div class="KeywordSuggester__BlackDeem"></div>

  <div class="KeywordSuggester__Container">
    <nav class="KeywordSuggester__TabNavigation">
      <ul class="KeywordSuggester__TabList">
        <li class="KeywordSuggester__TabItem">
          <div class="KeywordSuggester__TabButton KeywordSuggester__RecommendTabButton"
               onclick="trackEvent('CLICK_SEARCH_RECOMMEND')"
               role="button">
            추천 검색어
          </div>
        </li>

        <li class="KeywordSuggester__TabItem">
          <div class="KeywordSuggester__TabButton KeywordSuggester__PopularTabButton"
               onclick="trackEvent('CLICK_SEARCH_POPULAR')"
               role="button">
            인기 검색어
          </div>
        </li>

        <li class="KeywordSuggester__TabItem">
          <div class="KeywordSuggester__TabButton KeywordSuggester__HistoryTabButton"
               onclick="trackEvent('CLICK_SEARCH_RECENT')"
               role="button">
            최근 검색어
          </div>
        </li>
      </ul>
    </nav>

    <div class="KeywordSuggester__SuggestKeywordListWrap">
      <p class="KeywordSuggester__EmptyKeywordMessage">최근 검색어가 없습니다.</p>

      <div class="KeywordSuggester__Footer">
        <button class="KeywordSuggester__RemoveAllHistoryKeywordButton">
          x clear all
        </button>
      </div>
    </div>
  </div>
</div>

        