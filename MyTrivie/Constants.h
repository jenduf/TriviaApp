//
//  Constants.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#ifndef MyTrivie_Constants_h
#define MyTrivie_Constants_h

// helpful conversion for animation
#define RADIANS(degrees) ((degrees * (float)M_PI) / 180.0f)

#define DATE_FORMAT_STRING          @"yyyy-MM-dd'T'HH:mm:ssZZZ"

// Parse Keys
#define  PARSE_APPLICATION_ID   @"joewqlb5V79tseendTbkK9CAeLg78rdb8KT8dYHI"
#define  PARSE_CLIENT_KEY       @"WKAt5y9BLd41EXPx5HSSUD3sBEeGFl23DyTTo9FY"

// Storyboard Identifiers
#define LOGIN_VIEW_CONTROLLER           @"LoginViewController"
#define MAIN_MENU_VIEW_CONTROLLER       @"MainMenuViewController"
#define MAIN_MENU_CELL_IDENTIFIER       @"MainMenuCellIdentifier"
#define GAME_CREATION_VIEW_CONTROLLER   @"GameCreationViewController"
#define GAME_VIEW_CONTROLLER            @"GameViewController"
#define PROFILE_VIEW_CONTROLLER         @"ProfileViewController"
#define AVATAR_VIEW_CONTROLLER          @"AvatarViewController"
#define GAME_STATUS_VIEW_CONTROLLER     @"GameStatusViewController"

#define AVATAR_CELL_IDENTIFIER          @"AvatarCellIdentifier"
#define GAME_CARD_VIEW                  @"GameCard"
#define FINAL_TRIVIE_VIEW               @"FinalTrivie"

// Keys
#define GRADIENT_COLOR_ONE			@"Color 1"
#define GRADIENT_COLOR_TWO			@"Color 2"
#define PARSE_CATEGORY_KEY          @"Category"
#define PARSE_SUBCATEGORY_KEY       @"SubCategory"
#define PARSE_QUESTION_KEY          @"Question"
#define PARSE_MATCH_KEY             @"Match"

#define RANDOM_CATEGORY_ID              82
#define DEFAULT_AVATAR_ID               2
#define DEFAULT_TOKENS                  1000

// Layout and UI
#define CARD_BORDER_WIDTH               10
#define ANIMATING_VIEW_RADIANS          40
#define PADDING                         20
#define MENU_PADDING                    12
#define MENU_HEADER_PADDING             36
#define MENU_STROKE_GAP                 4
#define MENU_ARC_WIDTH                  30
#define MENU_ARC_HEIGHT                 8
#define PROFILE_CORNER_RADIUS           5
#define PROFILE_BORDER_WIDTH            2
#define ANIMATION_DURATION              0.25
#define MENU_HEADER_HEIGHT              84
#define GAME_OVERLAY_ANGLE_DIFFERENCE   16
#define TOP_BAR_LONG_FILL               100
#define TOP_BAR_MEDIUM_FILL             90
#define GAME_ANSWER_STROKE_WIDTH        4
#define GAME_CLOCK_STROKE               3
#define ANSWER_CORNER_RADIUS            8
#define POPUP_PADDING_TOP               5
#define POPUP_PADDING_BOTTOM            15
#define POPUP_TOP_SPACE                 10
#define CIRCLE_SIZE                     180
#define CIRCLE_LARGE_MULTIPLIER         1.18
#define CIRCLE_MEDIUM_MULTIPLIER        1.08
#define POPUP_RIBBON_PADDING            46
#define CATEGORY_BUTTON_PADDING         120
#define ARROW_X_PADDING                 6
#define ARROW_Y_PADDING                 18

// fonts
#define FONT_MUSEO_100		@"MuseoSans-100"
#define FONT_MUSEO_300		@"MuseoSans-300"
#define FONT_MUSEO_500		@"MuseoSans-500"
#define FONT_MUSEO_700		@"MuseoSans-700"
#define FONT_MUSEO_900		@"MuseoSans-900"

#define FONT_SIZE_MENU_HEADER       23
#define FONT_SIZE_CATEGORY          17
#define FONT_SIZE_CATEGORY_BUTTON   18
#define FONT_SIZE_CATEGORY_HEADER   22
#define FONT_SIZE_CATEGORY_TYPE     20

// Colors
#define COLOR_TRIVIE_GREEN                  @"0x419639"
#define COLOR_TRIVIE_GREEN_HIGHLIGHT_1      @"0x3A8E33"
#define COLOR_TRIVIE_GREEN_HIGHLIGHT_2      @"0x55B74B"
#define COLOR_TRIVIE_GREEN_TEXT             @"0x245e1f"
#define COLOR_TRIVIE_BLUE                   @"0x5e88a2"
#define COLOR_TRIVIE_BLUE_HIGHLIGHT_1       @"0x4A91BA"
#define COLOR_TRIVIE_BLUE_HIGHLIGHT_2       @"0x65ADCF"
#define COLOR_TRIVIE_BLUE_SELECTED_FILL     @"0xCAE8FA"
#define COLOR_TRIVIE_BLUE_TEXT              @"0x304c5e"
#define COLOR_TRIVIE_LIGHT_BLUE             @"0x75A3C0"
#define COLOR_TRIVIE_CHART                  @"0xB2BB1C"
#define COLOR_TRIVIE_PURPLE                 @"0x936fb1"
#define COLOR_TRIVIE_PURPLE_HIGHLIGHT_1     @"0x603E81"
#define COLOR_TRIVIE_PURPLE_HIGHLIGHT_2     @"0x704C91"
#define COLOR_TRIVIE_PURPLE_SELECTED_FILL   @"0xD6BEEA"
#define COLOR_TRIVIE_PURPLE_TEXT            @"0x4c355f"
#define COLOR_TRIVIE_LIGHT_PURPLE           @"0xAF8FCA"
#define COLOR_TRIVIE_ORANGE                 @"0xE3701E"
#define COLOR_TRIVIE_ORANGE_SELECTED_FILL   @"0xF8C8A6"
#define COLOR_TRIVIE_LIGHT_ORANGE           @"0xEC863D"
#define COLOR_TRIVIE_YELLOW                 @"0xf0b310"
#define COLOR_TRIVIE_YELLOW_SELECTED_FILL   @"0xF3DB99"
#define COLOR_TRIVIE_LIGHT_YELLOW           @"0xF8C53C"
#define COLOR_DARK_STROKE                   @"0x444444"
#define COLOR_TRIVIE_TEAL                   @"0x34A5A1"
#define COLOR_GAME_ANSWER_FILL              @"0xe1e1e1"
#define COLOR_FILL_CORRECT                  @"0xA8DCA3"
#define COLOR_STROKE_CORRECT                @"0x419639"
#define COLOR_FILL_INCORRECT                @"0xDE9C9C"
#define COLOR_STROKE_INCORRECT              @"0x891F1F"
#define COLOR_AVATAR_BORDER                 @"0xFFE500"

// Images
#define IMAGE_BACKGROUND_SQUARE             @"background_square"
#define IMAGE_MENU_HEADER                   @"menu_header_icon"
#define IMAGE_CATEGORY_RIBBON               @"ribbon"
#define IMAGE_GAME_CARD_ICON				@"game_card_icon"
#define IMAGE_CHART_BUTTON                  @"chart_button"
#define IMAGE_INTRO                         @"introanim"
#define IMAGE_POWERUP_ANIMATION             @"powerup_animation_"
#define IMAGE_BACK_BUTTON                   @"back_button"
#define IMAGE_PROFILE_BUTTON                @"profile_button"
#define IMAGE_SETTINGS_BUTTON               @"settings_button"
#define IMAGE_CHAT_BUTTON                   @"chat_button"
#define IMAGE_AVATAR                        @"avatar_"

// Text
#define SECTION_TITLE_YOUR_TURN             @"—  Your Turn  —"
#define SECTION_TITLE_THEIR_TURN            @"—  Their Turn  —"
#define SECTION_TITLE_FINISHED_GAMES        @"—  Finished Games  —"
#define RANDOM_CATEGORY_STRING              @"Random"
#define MY_CATEGORY_STRING                  @"My Category:"
#define GOT_IT_STRING                       @"Got it!"
#define CATEGORY_ROUND_STRING               @"Will Be Rounds 1 & 3"
#define TEXT_SETTINGS                       @"Settings"
#define TEXT_PROFILE                        @"Profile"
#define TEXT_CHAT                           @"Chat"
#define TEXT_WAITING_FOR_PLAYER             @"Waiting for Player"


// Item Counts
#define TOTAL_CATEGORY_CARD_OPTIONS             3
#define TOTAL_INTRO_ANIMATION_IMAGES            47
#define TOTAL_HYPERDRIVE_ANIMATION_IMAGES       28
#define TOTAL_STREAKER_ANIMATION_IMAGES         45
#define TOTAL_SECOND_CHANCE_ANIMATION_IMAGES	37
#define AVATARS_PER_SECTION                     8
#define TOTAL_AVATARS                           40
#define TOTAL_QUESTION_TIME                     120
#define ROUND_START                             3
#define TOTAL_QUESTIONS_PER_ROUND               4
#define TOTAL_ANSWERS                           3
#define TOTAL_ROUNDS                            3
#define TOTAL_TOKEN_DIGITS                      6

typedef int NavigationType;
enum
{
    NavigationTypeLeftRight = 0,
    NavigationTypeUpDown = 1
};

typedef int LoginScreen;
enum
{
    LoginScreenLogin = 0,
    LoginScreenRegister = 1,
    LoginScreenNone = 2
};

typedef int GameCreationScreen;
enum
{
    GameCreationScreenSelectCategory = 0,
    GameCreationScreenPowerUp = 1
};

typedef int BackgroundType;
enum
{
    BackgroundTypeNone = 0,
    BackgroundTypeColor = 1,
    BackgroundTypeScrolling = 2,
    BackgroundTypeGame = 3
};

typedef int PowerUpType;
enum
{
    PowerUpTypeHyperdrive = 0,
    PowerUpTypeSecondChance = 1,
    PowerUpTypeStreaker = 2
};

typedef int TrivieColor;
enum
{
    TrivieColorNone = 0,
    TrivieColorGreen = 1,
    TrivieColorBlue = 2,
    TrivieColorPurple = 3,
    TrivieColorYellow = 4,
    TrivieColorOrange = 5
};

typedef int GameCategoryType;
enum
{
    GameCategoryTypeCategory = 0,
    GameCategoryTypeSubCategory = 1
};

typedef int AnswerState;
enum
{
    AnswerStateNone = 0,
    AnswerStateSelectedCorrect = 1,
    AnswerStateSelectedIncorrect = 2,
    AnswerStateUnselectedCorrect = 3,
    AnswerStateUnselected = 4
};

typedef int MatchStatus;
enum
{
    MatchStatusWaiting = 0,
    MatchStatusStarted = 1,
    MatchStatusGameOver = 2
};

typedef int MatchSection;
enum
{
    MatchSectionYourTurn = 0,
    MatchSectionTheirTurn = 1,
    MatchSectionGameOver = 2
};

typedef int NavState;
enum
{
    NavStateIntro = 0,
    NavStateLogin = 1,
    NavStateMainMenu = 2,
    NavStateProfile = 3,
    NavStateGameStatus = 4
};

typedef int NavButtonState;
enum
{
    NavButtonStateNone = 0,
    NavButtonStateBack = 1,
    NavButtonStateSettings = 2,
    NavButtonStateProfile = 3,
    NavButtonStateChat = 4
};

#endif
