import requests

def requestdata():

    respones = requests.get('https://ipac.library.taichung.gov.tw/webpac/js/hot_keywords_json_data.json?date=1658995945888')
    obj=respones.json()
    dric=(obj['keyword'])
    results = (dric[2]['hot_keyword_text'])
    # print(results)
    return results


# requestdata()


