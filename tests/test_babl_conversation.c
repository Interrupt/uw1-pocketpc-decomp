#include "babl_conversation_fixture.h"

/* Level 1, "Ketchaval and Retichall": the Gray Goblin king won't talk until his
   wife has given permission, and she can be flattered into giving it. These
   run the real CNV.ARK scripts (conversations 7 and 8) end to end. */
#define KETCHAVAL CONV_NPC_SLOT_KETCHAVAL
#define RETICHALL CONV_NPC_SLOT_RETICHALL

void setUp(void) { conv_reset(); }
void tearDown(void) { if (getenv("CONV_DUMP")) conv_dump(); }

static int last_line_is(char kind, const char *text)
{
    return conv_log_count && conv_log[conv_log_count - 1].kind == kind &&
           strstr(conv_log[conv_log_count - 1].text, text);
}
static void forget_log(void) { conv_log_count = 0; }

/* Retichall: ask to see her husband and give her `reason`. */
static void talk_to_retichall(const char *reason)
{
    conv_pick("speak to thy husband", NULL);
    conv_pick(reason, NULL);
    conv_pick("I thank thee", NULL);
    conv_talk(RETICHALL);
    conv_expect_finished();
}
/* Ketchaval refuses to talk and the conversation ends. */
static void ketchaval_turns_us_away(void)
{
    forget_log();
    conv_pick("I knew not", NULL);
    conv_talk(KETCHAVAL);
    conv_expect_finished();
    TEST_ASSERT_TRUE(conv_log_has(CONV_SPEECH, "without the consent of my bride"));
    TEST_ASSERT_TRUE(last_line_is(CONV_SPEECH, "Well, ye know now!  Good-bye!"));
    TEST_ASSERT_FALSE(conv_log_has(CONV_SPEECH, "Who be ye"));
}

static void test_ketchaval_will_not_talk_without_his_wifes_permission(void)
{
    ketchaval_turns_us_away();
}
static void test_ketchaval_farewell_choice_also_ends_the_conversation(void)
{
    conv_pick("Farewell", NULL);
    conv_talk(KETCHAVAL);
    conv_expect_finished();
    TEST_ASSERT_TRUE(conv_log_has(CONV_SPEECH, "without the consent of my bride"));
    TEST_ASSERT_FALSE(conv_log_has(CONV_SPEECH, "Who be ye"));
    TEST_ASSERT_FALSE(conv_log_has(CONV_SPEECH, "Well, ye know now"));
}
static void test_retichall_can_be_flattered_into_giving_permission(void)
{
    talk_to_retichall("congratulate");
    TEST_ASSERT_TRUE(conv_log_has(CONV_SPEECH, "Very well, thou mayst speak to him"));
}
static void test_retichall_also_listens_to_important_information(void)
{
    talk_to_retichall("important information");
    TEST_ASSERT_TRUE(conv_log_has(CONV_SPEECH, "Very well, thou mayst speak to him"));
}
static void test_retichall_refuses_goblin_friends_and_small_talk(void)
{
    static const char *const reasons[] = {"message from the Green Goblins", "merely wish to chat"};
    static const char *const answers[] = {"We have no desire to hear from them", "time of a king is more precious"};
    for (int i = 0; i < 2; i++) {
        conv_reset();
        conv_pick("speak to thy husband", NULL);
        conv_pick(reasons[i], NULL);
        conv_talk(RETICHALL);
        conv_expect_finished();
        TEST_ASSERT_TRUE(last_line_is(CONV_SPEECH, answers[i]));
        TEST_ASSERT_FALSE(conv_log_has(CONV_SPEECH, "Very well"));
        ketchaval_turns_us_away();
    }
}
static void test_retichall_lets_us_leave_without_asking(void)
{
    conv_pick("Never mind", NULL);
    conv_talk(RETICHALL);
    conv_expect_finished();
    ketchaval_turns_us_away();
}
static void test_retichall_will_not_repeat_herself_once_permission_is_given(void)
{
    talk_to_retichall("congratulate");
    forget_log();
    conv_talk(RETICHALL);
    conv_expect_finished();
    TEST_ASSERT_EQUAL_INT(1, conv_log_count);
    TEST_ASSERT_TRUE(last_line_is(CONV_SPEECH, "Speak to me no more!"));
}

static void ask_ketchaval_about_himself(void)
{
    conv_pick("wish to speak to thee", NULL);
    conv_pick("Vernix who", NULL);
    conv_pick("no friend of his", NULL);
    conv_pick("Yes, I did", NULL);
    conv_pick("I agree", NULL);
}
static void test_ketchaval_talks_once_his_wife_has_agreed(void)
{
    ketchaval_turns_us_away();
    talk_to_retichall("congratulate");
    forget_log();
    ask_ketchaval_about_himself();
    conv_pick("Such a job", NULL);
    conv_pick("Terrible", NULL);
    conv_pick("Cabirus", NULL);
    conv_pick("Tragic", NULL);
    conv_pick("No.  I thank thee.  Farewell", NULL);
    conv_talk(KETCHAVAL);
    conv_expect_finished();
    TEST_ASSERT_TRUE(conv_log_has(CONV_SPEECH, "Who be ye and what business"));
    TEST_ASSERT_TRUE(conv_log_has(CONV_SPEECH, "I be Ketchaval, the mighty leader"));
    TEST_ASSERT_TRUE(conv_log_has(CONV_SPEECH, "My enemies are legion"));
    TEST_ASSERT_TRUE(conv_log_has(CONV_SPEECH, "A human fool named Cabirus"));
    TEST_ASSERT_FALSE(conv_log_has(CONV_SPEECH, "consent of my bride"));
}
static void test_the_player_can_tell_ketchaval_their_name(void)
{
    talk_to_retichall("congratulate");
    forget_log();
    conv_pick("wish to speak to thee", NULL);
    conv_pick("Vernix who", NULL);
    conv_pick("no friend of his", NULL);
    conv_pick("Yes, I did", NULL);
    conv_pick("I agree", NULL);
    conv_pick("I am glad for thee", NULL);
    conv_talk(KETCHAVAL);
    conv_expect_finished();
    TEST_ASSERT_TRUE(conv_log_has(CONV_CHOICE, "I am Avatar.  I wish to speak to thee."));
    TEST_ASSERT_FALSE(conv_log_has(CONV_CHOICE, "@GS8"));
}
static void test_each_answer_leads_to_its_own_reply(void)
{
    talk_to_retichall("congratulate");
    forget_log();
    ask_ketchaval_about_himself();
    conv_pick("Have the Greens", NULL);
    conv_pick("Thou hast helped me already", NULL);
    conv_talk(KETCHAVAL);
    conv_expect_finished();
    TEST_ASSERT_TRUE(conv_log_has(CONV_SPEECH, "They are distrusting, vindictive"));
    TEST_ASSERT_FALSE(conv_log_has(CONV_SPEECH, "My enemies are legion"));
}


/* Bartering. Neither goblin's script has a trade menu, so these use the
   Mountainfolk trader (conversation 88: "I would like to trade items with
   thee"), played by a level-1 goblin record. Its barter loop is the shape every
   trader's script shares: offer / demand / think about it / "do not wish to
   barter any further", repeating until the deal is done or declined. */
#define TRADER 230
#define NPC_ITEM 1       /* the trader's stock: object 0x30, worth 100 */
#define OUR_ITEM 2       /* what we put forward: object 0x31 */

static void start_trading(void)
{
    conv_pick("unjustly imprisoned", NULL);
    conv_pick("trade items", NULL);
}
static void barter_setUp(void)
{
    conv_reset();
    conv_set_object_value(0x30, 100);
    conv_set_object_value(0x31, 200);
    conv_npc_add_item(TRADER, NPC_ITEM, 0x30);
    conv_set_trade_stats(TRADER, 0x34, 0x44);
}
static void talk_to_trader(void)
{
    conv_talk_as(TRADER, 88);
    conv_expect_finished();
}
static int times_shown(const char *menu_text)
{
    int count = 0;
    for (int i = 0; i < conv_log_count; i++)
        count += conv_log[i].kind == CONV_MENU && strstr(conv_log[i].text, menu_text);
    return count;
}
/* We put our item forward and ask for the trader's stock in return. */
static void offer_our_item(void)
{
    conv_player_offers(0, OUR_ITEM, 0x31);
    DAT_000bbff0_backing[0] = 1;
}
static void offer_a_worthless_item(void)
{
    conv_set_object_value(0x31, 20);
    offer_our_item();
}
static void demand_the_stock(void) { DAT_000bbff0_backing[0] = 1; }
static int npc_goal(void) { return *(ushort *)((byte *)conv_npc + 11) & 0xf; }

static void test_leaving_the_barter_ends_it_and_the_conversation(void)
{
    barter_setUp();
    start_trading();
    conv_pick("do not wish to barter any further", NULL);
    conv_pick("Farewell", NULL);
    talk_to_trader();
    TEST_ASSERT_EQUAL_INT(1, times_shown("make thee this offer"));
    TEST_ASSERT_TRUE(last_line_is(CONV_SPEECH, "Farewell."));
    TEST_ASSERT_EQUAL_INT(NPC_ITEM, conv_npc[3] >> 6); /* the stock is back with the trader */
    TEST_ASSERT_EQUAL_INT(0, DAT_000bbfe8_backing[0]);
}
static void test_items_left_in_the_barter_slots_are_returned_when_the_conversation_ends(void)
{
    barter_setUp();
    start_trading();
    conv_pick("make thee this offer", offer_a_worthless_item);
    conv_pick("do not wish to barter any further", NULL);
    conv_pick("Farewell", NULL);
    talk_to_trader();
    TEST_ASSERT_EQUAL_INT(1, babl_drop_count);
    TEST_ASSERT_EQUAL_PTR(babl_items[OUR_ITEM], babl_dropped[0]);
    TEST_ASSERT_EQUAL_PTR(g_player_object, babl_drop_owner[0]);
}
static void test_a_struck_deal_hands_over_the_stock_when_the_conversation_ends(void)
{
    barter_setUp();
    start_trading();
    conv_pick("make thee this offer", offer_our_item);
    conv_pick("Farewell", NULL);
    talk_to_trader();
    TEST_ASSERT_EQUAL_INT(1, babl_drop_count);
    TEST_ASSERT_EQUAL_PTR(babl_items[NPC_ITEM], babl_dropped[0]);
}
static void test_an_empty_offer_is_laughed_at_and_the_barter_goes_on(void)
{
    barter_setUp();
    start_trading();
    conv_pick("make thee this offer", NULL);
    conv_pick("do not wish to barter any further", NULL);
    conv_pick("Farewell", NULL);
    talk_to_trader();
    TEST_ASSERT_TRUE(conv_log_has(CONV_SPEECH, "Surely thou art joking."));
    TEST_ASSERT_EQUAL_INT(2, times_shown("make thee this offer"));
    TEST_ASSERT_EQUAL_INT(NPC_ITEM, conv_npc[3] >> 6);
}
static void test_a_generous_offer_is_accepted_and_the_barter_ends(void)
{
    barter_setUp();
    start_trading();
    conv_pick("make thee this offer", offer_our_item);
    conv_pick("Farewell", NULL);
    talk_to_trader();
    TEST_ASSERT_TRUE(conv_log_has(CONV_SPEECH, "I accept thy offer."));
    TEST_ASSERT_FALSE(conv_log_has(CONV_SPEECH, "Surely thou art joking."));
    TEST_ASSERT_EQUAL_INT(1, times_shown("make thee this offer")); /* the barter menu did not come back */
    TEST_ASSERT_EQUAL_INT(OUR_ITEM, conv_npc[3] >> 6);             /* the trader now holds our item */
    TEST_ASSERT_EQUAL_INT(0, DAT_000bbfd0_backing[0]);
    TEST_ASSERT_EQUAL_INT(1, DAT_000bc008);                        /* the deal is struck */
}
static void test_a_poor_offer_is_turned_down_until_the_trader_tires_of_haggling(void)
{
    barter_setUp();
    start_trading();
    for (int offers = 0; offers < 7; offers++)
        conv_pick("make thee this offer", offer_a_worthless_item);
    conv_pick("do not wish to barter any further", NULL);
    conv_pick("Farewell", NULL);
    talk_to_trader();
    TEST_ASSERT_TRUE(conv_log_has(CONV_SPEECH, "No, I do not like this deal."));
    TEST_ASSERT_TRUE(conv_log_has(CONV_SPEECH, "Dost thou take me for a fool?"));
    TEST_ASSERT_TRUE(conv_log_has(CONV_SPEECH, "I am weary of this haggling."));
    TEST_ASSERT_FALSE(conv_log_has(CONV_SPEECH, "I accept thy offer."));
    TEST_ASSERT_EQUAL_INT(0, DAT_000bc008);
    TEST_ASSERT_EQUAL_INT(NPC_ITEM, conv_npc[3] >> 6);
}
static void test_thinking_it_over_comments_on_the_deal_and_the_barter_goes_on(void)
{
    barter_setUp();
    start_trading();
    conv_pick("think about this deal", offer_our_item);
    conv_pick("do not wish to barter any further", NULL);
    conv_pick("Farewell", NULL);
    talk_to_trader();
    TEST_ASSERT_EQUAL_INT(2, times_shown("make thee this offer"));
    TEST_ASSERT_FALSE(conv_log_has(CONV_SPEECH, "I accept thy offer."));
    TEST_ASSERT_EQUAL_INT(0, DAT_000bc008);
}
static void test_a_weak_demand_is_refused_and_ends_the_conversation(void)
{
    barter_setUp();
    start_trading();
    conv_pick("I demand", demand_the_stock);
    conv_pick("Yes, I must", NULL);
    talk_to_trader(); /* no further menu: the trader will not talk to a robber */
    TEST_ASSERT_TRUE(conv_log_has(CONV_SPEECH, "Dost thou intend to rob me?"));
    TEST_ASSERT_TRUE(last_line_is(CONV_SPEECH, "No! Thou shalt not take them!"));
    TEST_ASSERT_EQUAL_INT(1, times_shown("make thee this offer"));
    TEST_ASSERT_EQUAL_INT(NPC_ITEM, conv_npc[3] >> 6);
    TEST_ASSERT_EQUAL_INT(5, npc_goal());
}
static void test_a_forceful_demand_is_given_in_and_the_barter_ends(void)
{
    barter_setUp();
    DAT_00086df8[0x3d] = 30;
    start_trading();
    conv_pick("I demand", demand_the_stock);
    conv_pick("Yes, I must", NULL);
    conv_pick("Farewell", NULL);
    talk_to_trader();
    TEST_ASSERT_TRUE(conv_log_has(CONV_SPEECH, "If thou dost insist, thou canst have them."));
    TEST_ASSERT_EQUAL_INT(1, times_shown("make thee this offer"));
    TEST_ASSERT_EQUAL_INT(1, DAT_000bc008);
    TEST_ASSERT_NOT_EQUAL(5, npc_goal()); /* not roused to attack */
}
static void test_changing_our_mind_about_a_demand_returns_to_the_barter(void)
{
    barter_setUp();
    start_trading();
    conv_pick("I demand", demand_the_stock);
    conv_pick("No, thou dost misunderstand me", NULL);
    conv_pick("do not wish to barter any further", NULL);
    conv_pick("Farewell", NULL);
    talk_to_trader();
    TEST_ASSERT_EQUAL_INT(2, times_shown("make thee this offer"));
    TEST_ASSERT_EQUAL_INT(0, DAT_000bc008);
    TEST_ASSERT_EQUAL_INT(NPC_ITEM, conv_npc[3] >> 6);
}

int main(void)
{
    UNITY_BEGIN();
    conv_fixture_begin();
    RUN_TEST(test_ketchaval_will_not_talk_without_his_wifes_permission);
    RUN_TEST(test_ketchaval_farewell_choice_also_ends_the_conversation);
    RUN_TEST(test_retichall_can_be_flattered_into_giving_permission);
    RUN_TEST(test_retichall_also_listens_to_important_information);
    RUN_TEST(test_retichall_refuses_goblin_friends_and_small_talk);
    RUN_TEST(test_retichall_lets_us_leave_without_asking);
    RUN_TEST(test_retichall_will_not_repeat_herself_once_permission_is_given);
    RUN_TEST(test_ketchaval_talks_once_his_wife_has_agreed);
    RUN_TEST(test_the_player_can_tell_ketchaval_their_name);
    RUN_TEST(test_each_answer_leads_to_its_own_reply);
    RUN_TEST(test_leaving_the_barter_ends_it_and_the_conversation);
    RUN_TEST(test_items_left_in_the_barter_slots_are_returned_when_the_conversation_ends);
    RUN_TEST(test_a_struck_deal_hands_over_the_stock_when_the_conversation_ends);
    RUN_TEST(test_an_empty_offer_is_laughed_at_and_the_barter_goes_on);
    RUN_TEST(test_a_generous_offer_is_accepted_and_the_barter_ends);
    RUN_TEST(test_a_poor_offer_is_turned_down_until_the_trader_tires_of_haggling);
    RUN_TEST(test_thinking_it_over_comments_on_the_deal_and_the_barter_goes_on);
    RUN_TEST(test_a_weak_demand_is_refused_and_ends_the_conversation);
    RUN_TEST(test_a_forceful_demand_is_given_in_and_the_barter_ends);
    RUN_TEST(test_changing_our_mind_about_a_demand_returns_to_the_barter);
    conv_fixture_end();
    return UNITY_END();
}
