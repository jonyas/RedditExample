const emptySubredditResponse = r'''
{
    "kind": "Listing",
    "data": {
        "modhash": "",
        "dist": 0,
        "children": [],
        "after": "t3_fnn17n",
        "before": null
    }
}
''';

const singleEntrySubredditResponse = r'''
{
    "kind": "Listing",
    "data": {
        "modhash": "",
        "dist": 1,
        "children": [
            {
                "kind": "t3",
                "data": {
                    "approved_at_utc": null,
                    "subreddit": "ClimateActionPlan",
                    "selftext": "I hope everybody's doing well. If you're working from home and can, please make sure you walk around outside (but maintain a social distance of 6 feet minimum.) \n\nOne glimmer of good news we can take from this situation is that we will see a reduction in carbon emissions. Nowhere near as many people are driving to work now, or flying. Same can probably be said for people on cruises as well. Even if this only goes on for a few months, this is still a much needed reduction in CO2. Of course when quarantines are lifted trips that were cancelled will resume, however by the end of this year there will still be a noticeable drop in overall emissions.",
                    "author_fullname": "t2_1bjvt3jo",
                    "saved": false,
                    "mod_reason_title": null,
                    "gilded": 0,
                    "clicked": false,
                    "title": "One bit of good news to take from the COVID-19 outbreak.",
                    "link_flair_richtext": [],
                    "subreddit_name_prefixed": "r/ClimateActionPlan",
                    "hidden": false,
                    "pwls": 6,
                    "link_flair_css_class": null,
                    "downs": 0,
                    "thumbnail_height": null,
                    "hide_score": false,
                    "name": "t3_fkvbje",
                    "quarantine": false,
                    "link_flair_text_color": "dark",
                    "author_flair_background_color": "#dadada",
                    "subreddit_type": "public",
                    "ups": 42,
                    "total_awards_received": 0,
                    "media_embed": {},
                    "thumbnail_width": null,
                    "author_flair_template_id": "d5537128-88e7-11e9-a3d3-0e4624f35dc2",
                    "is_original_content": false,
                    "user_reports": [],
                    "secure_media": null,
                    "is_reddit_media_domain": false,
                    "is_meta": false,
                    "category": null,
                    "secure_media_embed": {},
                    "link_flair_text": null,
                    "can_mod_post": false,
                    "score": 42,
                    "approved_by": null,
                    "author_premium": true,
                    "thumbnail": "self",
                    "edited": false,
                    "author_flair_css_class": null,
                    "author_flair_richtext": [],
                    "gildings": {},
                    "content_categories": null,
                    "is_self": true,
                    "mod_note": null,
                    "created": 1584587919.0,
                    "link_flair_type": "text",
                    "wls": 6,
                    "removed_by_category": null,
                    "banned_by": null,
                    "author_flair_type": "text",
                    "domain": "self.ClimateActionPlan",
                    "allow_live_comments": false,
                    "selftext_html": "&lt;!-- SC_OFF --&gt;&lt;div class=\"md\"&gt;&lt;p&gt;I hope everybody&amp;#39;s doing well. If you&amp;#39;re working from home and can, please make sure you walk around outside (but maintain a social distance of 6 feet minimum.) &lt;/p&gt;\n\n&lt;p&gt;One glimmer of good news we can take from this situation is that we will see a reduction in carbon emissions. Nowhere near as many people are driving to work now, or flying. Same can probably be said for people on cruises as well. Even if this only goes on for a few months, this is still a much needed reduction in CO2. Of course when quarantines are lifted trips that were cancelled will resume, however by the end of this year there will still be a noticeable drop in overall emissions.&lt;/p&gt;\n&lt;/div&gt;&lt;!-- SC_ON --&gt;",
                    "likes": null,
                    "suggested_sort": null,
                    "banned_at_utc": null,
                    "view_count": null,
                    "archived": false,
                    "no_follow": false,
                    "is_crosspostable": false,
                    "pinned": false,
                    "over_18": false,
                    "all_awardings": [],
                    "awarders": [],
                    "media_only": false,
                    "can_gild": false,
                    "spoiler": false,
                    "locked": false,
                    "author_flair_text": "Mod/Creator",
                    "visited": false,
                    "removed_by": null,
                    "num_reports": null,
                    "distinguished": null,
                    "subreddit_id": "t5_ne8p6",
                    "mod_reason_by": null,
                    "removal_reason": null,
                    "link_flair_background_color": "",
                    "id": "fkvbje",
                    "is_robot_indexable": true,
                    "report_reasons": null,
                    "author": "UT_Teapot",
                    "discussion_type": null,
                    "num_comments": 9,
                    "send_replies": true,
                    "whitelist_status": "all_ads",
                    "contest_mode": false,
                    "mod_reports": [],
                    "author_patreon_flair": false,
                    "author_flair_text_color": "dark",
                    "permalink": "/r/ClimateActionPlan/comments/fkvbje/one_bit_of_good_news_to_take_from_the_covid19/",
                    "parent_whitelist_status": "all_ads",
                    "stickied": true,
                    "url": "https://www.reddit.com/r/ClimateActionPlan/comments/fkvbje/one_bit_of_good_news_to_take_from_the_covid19/",
                    "subreddit_subscribers": 60887,
                    "created_utc": 1584559119.0,
                    "num_crossposts": 0,
                    "media": null,
                    "is_video": false
                }
            }
        ],
        "after": "t3_fnn17n",
        "before": null
    }
}
''';

const emptySubredditCommentsResponse = r'''
[
    {
        "kind": "Listing",
        "data": {
            "modhash": "",
            "dist": 1,
            "children": [
                  {
                  "kind": "t3",
                  "data": {
                      "approved_at_utc": null,
                      "subreddit": "ClimateActionPlan",
                      "selftext": "I hope everybody's doing well. If you're working from home and can, please make sure you walk around outside (but maintain a social distance of 6 feet minimum.) \n\nOne glimmer of good news we can take from this situation is that we will see a reduction in carbon emissions. Nowhere near as many people are driving to work now, or flying. Same can probably be said for people on cruises as well. Even if this only goes on for a few months, this is still a much needed reduction in CO2. Of course when quarantines are lifted trips that were cancelled will resume, however by the end of this year there will still be a noticeable drop in overall emissions.",
                      "author_fullname": "t2_1bjvt3jo",
                      "saved": false,
                      "mod_reason_title": null,
                      "gilded": 0,
                      "clicked": false,
                      "title": "One bit of good news to take from the COVID-19 outbreak.",
                      "link_flair_richtext": [],
                      "subreddit_name_prefixed": "r/ClimateActionPlan",
                      "hidden": false,
                      "pwls": 6,
                      "link_flair_css_class": null,
                      "downs": 0,
                      "thumbnail_height": null,
                      "hide_score": false,
                      "name": "t3_fkvbje",
                      "quarantine": false,
                      "link_flair_text_color": "dark",
                      "author_flair_background_color": "#dadada",
                      "subreddit_type": "public",
                      "ups": 42,
                      "total_awards_received": 0,
                      "media_embed": {},
                      "thumbnail_width": null,
                      "author_flair_template_id": "d5537128-88e7-11e9-a3d3-0e4624f35dc2",
                      "is_original_content": false,
                      "user_reports": [],
                      "secure_media": null,
                      "is_reddit_media_domain": false,
                      "is_meta": false,
                      "category": null,
                      "secure_media_embed": {},
                      "link_flair_text": null,
                      "can_mod_post": false,
                      "score": 42,
                      "approved_by": null,
                      "author_premium": true,
                      "thumbnail": "self",
                      "edited": false,
                      "author_flair_css_class": null,
                      "author_flair_richtext": [],
                      "gildings": {},
                      "content_categories": null,
                      "is_self": true,
                      "mod_note": null,
                      "created": 1584587919.0,
                      "link_flair_type": "text",
                      "wls": 6,
                      "removed_by_category": null,
                      "banned_by": null,
                      "author_flair_type": "text",
                      "domain": "self.ClimateActionPlan",
                      "allow_live_comments": false,
                      "selftext_html": "&lt;!-- SC_OFF --&gt;&lt;div class=\"md\"&gt;&lt;p&gt;I hope everybody&amp;#39;s doing well. If you&amp;#39;re working from home and can, please make sure you walk around outside (but maintain a social distance of 6 feet minimum.) &lt;/p&gt;\n\n&lt;p&gt;One glimmer of good news we can take from this situation is that we will see a reduction in carbon emissions. Nowhere near as many people are driving to work now, or flying. Same can probably be said for people on cruises as well. Even if this only goes on for a few months, this is still a much needed reduction in CO2. Of course when quarantines are lifted trips that were cancelled will resume, however by the end of this year there will still be a noticeable drop in overall emissions.&lt;/p&gt;\n&lt;/div&gt;&lt;!-- SC_ON --&gt;",
                      "likes": null,
                      "suggested_sort": null,
                      "banned_at_utc": null,
                      "view_count": null,
                      "archived": false,
                      "no_follow": false,
                      "is_crosspostable": false,
                      "pinned": false,
                      "over_18": false,
                      "all_awardings": [],
                      "awarders": [],
                      "media_only": false,
                      "can_gild": false,
                      "spoiler": false,
                      "locked": false,
                      "author_flair_text": "Mod/Creator",
                      "visited": false,
                      "removed_by": null,
                      "num_reports": null,
                      "distinguished": null,
                      "subreddit_id": "t5_ne8p6",
                      "mod_reason_by": null,
                      "removal_reason": null,
                      "link_flair_background_color": "",
                      "id": "fkvbje",
                      "is_robot_indexable": true,
                      "report_reasons": null,
                      "author": "UT_Teapot",
                      "discussion_type": null,
                      "num_comments": 9,
                      "send_replies": true,
                      "whitelist_status": "all_ads",
                      "contest_mode": false,
                      "mod_reports": [],
                      "author_patreon_flair": false,
                      "author_flair_text_color": "dark",
                      "permalink": "/r/ClimateActionPlan/comments/fkvbje/one_bit_of_good_news_to_take_from_the_covid19/",
                      "parent_whitelist_status": "all_ads",
                      "stickied": true,
                      "url": "https://www.reddit.com/r/ClimateActionPlan/comments/fkvbje/one_bit_of_good_news_to_take_from_the_covid19/",
                      "subreddit_subscribers": 60887,
                      "created_utc": 1584559119.0,
                      "num_crossposts": 0,
                      "media": null,
                      "is_video": false
                  }
              }
            ],
            "after": null,
            "before": null
        }
    },
    {
        "kind": "Listing",
        "data": {
            "modhash": "",
            "dist": null,
            "children": [],
            "after": null,
            "before": null
        }
    }
]
''';

const singleSubredditCommentsResponse = r'''
[
   {
      "kind":"Listing",
      "data":{
         "modhash":"",
         "dist":1,
         "children":[
            {
               "kind":"t3",
               "data":{
                  "approved_at_utc":null,
                  "subreddit":"ClimateActionPlan",
                  "selftext":"Please use this thread to post your current Climate Action oriented discussions and any other concerns or comments about climate change action in general. Any victories, concerns, or other material that does not abide by normal forum post guidelines is open for discussion here. \n\nPlease stick to current subreddit rules and keep things polite, cordial, and non-political. We still do not allow doomism or climate change propaganda, but you can discuss it as a means of working to combat it with facts or actions.",
                  "user_reports":[

                  ],
                  "saved":false,
                  "mod_reason_title":null,
                  "gilded":0,
                  "clicked":false,
                  "title":"Weekly /r/ClimateActionPlan Discussion Thread - March 29, 2020",
                  "link_flair_richtext":[

                  ],
                  "subreddit_name_prefixed":"r/ClimateActionPlan",
                  "hidden":false,
                  "pwls":6,
                  "link_flair_css_class":"",
                  "downs":0,
                  "thumbnail_height":null,
                  "parent_whitelist_status":"all_ads",
                  "hide_score":false,
                  "name":"t3_fr1s62",
                  "quarantine":false,
                  "link_flair_text_color":"dark",
                  "upvote_ratio":1.0,
                  "author_flair_background_color":null,
                  "subreddit_type":"public",
                  "ups":10,
                  "total_awards_received":0,
                  "media_embed":{

                  },
                  "thumbnail_width":null,
                  "author_flair_template_id":null,
                  "is_original_content":false,
                  "author_fullname":"t2_6l4z3",
                  "secure_media":null,
                  "is_reddit_media_domain":false,
                  "is_meta":false,
                  "category":null,
                  "secure_media_embed":{

                  },
                  "link_flair_text":"Approved Discussion",
                  "can_mod_post":false,
                  "num_duplicates":0,
                  "approved_by":null,
                  "author_premium":true,
                  "thumbnail":"self",
                  "edited":false,
                  "author_flair_css_class":null,
                  "author_flair_richtext":[

                  ],
                  "gildings":{

                  },
                  "content_categories":null,
                  "is_self":true,
                  "mod_note":null,
                  "created":1585494335.0,
                  "link_flair_type":"text",
                  "wls":6,
                  "removed_by_category":null,
                  "banned_by":null,
                  "author_flair_type":"text",
                  "domain":"self.ClimateActionPlan",
                  "allow_live_comments":false,
                  "selftext_html":"&lt;!-- SC_OFF --&gt;&lt;div class=\"md\"&gt;&lt;p&gt;Please use this thread to post your current Climate Action oriented discussions and any other concerns or comments about climate change action in general. Any victories, concerns, or other material that does not abide by normal forum post guidelines is open for discussion here. &lt;/p&gt;\n\n&lt;p&gt;Please stick to current subreddit rules and keep things polite, cordial, and non-political. We still do not allow doomism or climate change propaganda, but you can discuss it as a means of working to combat it with facts or actions.&lt;/p&gt;\n&lt;/div&gt;&lt;!-- SC_ON --&gt;",
                  "likes":null,
                  "suggested_sort":null,
                  "banned_at_utc":null,
                  "view_count":null,
                  "archived":false,
                  "score":10,
                  "no_follow":true,
                  "is_crosspostable":false,
                  "pinned":false,
                  "over_18":false,
                  "all_awardings":[

                  ],
                  "awarders":[

                  ],
                  "media_only":false,
                  "link_flair_template_id":"f70d1f56-bba7-11e9-adb0-0e7eae8dcdb0",
                  "can_gild":false,
                  "spoiler":false,
                  "locked":false,
                  "author_flair_text":null,
                  "treatment_tags":[

                  ],
                  "visited":false,
                  "removed_by":null,
                  "num_reports":null,
                  "distinguished":"moderator",
                  "subreddit_id":"t5_ne8p6",
                  "mod_reason_by":null,
                  "removal_reason":null,
                  "link_flair_background_color":"#edeff1",
                  "id":"fr1s62",
                  "is_robot_indexable":true,
                  "report_reasons":null,
                  "author":"AutoModerator",
                  "discussion_type":null,
                  "num_comments":5,
                  "send_replies":false,
                  "media":null,
                  "contest_mode":false,
                  "author_patreon_flair":false,
                  "author_flair_text_color":null,
                  "permalink":"/r/ClimateActionPlan/comments/fr1s62/weekly_rclimateactionplan_discussion_thread_march/",
                  "whitelist_status":"all_ads",
                  "stickied":true,
                  "url":"https://www.reddit.com/r/ClimateActionPlan/comments/fr1s62/weekly_rclimateactionplan_discussion_thread_march/",
                  "subreddit_subscribers":60894,
                  "created_utc":1585465535.0,
                  "num_crossposts":0,
                  "mod_reports":[

                  ],
                  "is_video":false
               }
            }
         ],
         "after":null,
         "before":null
      }
   },
   {
      "kind":"Listing",
      "data":{
         "modhash":"",
         "dist":null,
         "children":[
            {
               "kind":"t1",
               "data":{
                  "total_awards_received":0,
                  "approved_at_utc":null,
                  "ups":6,
                  "awarders":[

                  ],
                  "mod_reason_by":null,
                  "banned_by":null,
                  "author_flair_type":"text",
                  "removal_reason":null,
                  "link_id":"t3_fr1s62",
                  "author_flair_template_id":null,
                  "likes":null,
                  "replies":"",
                  "user_reports":[

                  ],
                  "saved":false,
                  "id":"fluadn3",
                  "banned_at_utc":null,
                  "mod_reason_title":null,
                  "gilded":0,
                  "archived":false,
                  "no_follow":true,
                  "author":"BiLemons",
                  "can_mod_post":false,
                  "send_replies":true,
                  "parent_id":"t3_fr1s62",
                  "score":6,
                  "author_fullname":"t2_3ky20ydm",
                  "report_reasons":null,
                  "approved_by":null,
                  "all_awardings":[

                  ],
                  "subreddit_id":"t5_ne8p6",
                  "body":"I hope everyone stays safe with corona going around. I love seeing all these good news here and it legitimately makes me happy. WE can do this!",
                  "edited":false,
                  "downs":0,
                  "author_flair_css_class":null,
                  "is_submitter":false,
                  "collapsed":false,
                  "author_flair_richtext":[

                  ],
                  "author_patreon_flair":false,
                  "body_html":"&lt;div class=\"md\"&gt;&lt;p&gt;I hope everyone stays safe with corona going around. I love seeing all these good news here and it legitimately makes me happy. WE can do this!&lt;/p&gt;\n&lt;/div&gt;",
                  "gildings":{

                  },
                  "collapsed_reason":null,
                  "associated_award":null,
                  "stickied":false,
                  "author_premium":false,
                  "subreddit_type":"public",
                  "can_gild":true,
                  "subreddit":"ClimateActionPlan",
                  "author_flair_text_color":null,
                  "score_hidden":false,
                  "permalink":"/r/ClimateActionPlan/comments/fr1s62/weekly_rclimateactionplan_discussion_thread_march/fluadn3/",
                  "num_reports":null,
                  "locked":false,
                  "name":"t1_fluadn3",
                  "created":1585527428.0,
                  "author_flair_text":null,
                  "treatment_tags":[

                  ],
                  "created_utc":1585498628.0,
                  "subreddit_name_prefixed":"r/ClimateActionPlan",
                  "controversiality":0,
                  "depth":0,
                  "author_flair_background_color":null,
                  "collapsed_because_crowd_control":null,
                  "mod_reports":[

                  ],
                  "mod_note":null,
                  "distinguished":null
               }
            }
         ],
         "after":null,
         "before":null
      }
   }
]
''';
