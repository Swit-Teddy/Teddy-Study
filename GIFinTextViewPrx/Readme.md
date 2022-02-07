# Stremoji

## 특징

**1. UITextView Extension을 이용해 TextView를 TextView > UIView > [UILabel, UIImageView] 형태로 만들어 GIF를 편리하게 재생시켜줄 수 있음**  
**( TextView의 Attachment로 UIImage를 넣을 수 있긴한데, UIImage는  GIF가 안먹음. UIImageView에서 animating을 이용해서 재생해야함 )**

**2. Dictionary 형태로 ([”Key” : “Value”]) 사용자 정의 이모티콘을 정의할 수 있음**
    
    
아래는 예시 !
    <br>
    <br>

    
- **EmojiSource**

```swift
/*
	Key 에는 원하는 이름의 문자열, 
	Value 에는 다양한 형태로 키값과 대치 가능
	
	**ex)**
	**imageAsset → imageAsset(”Asset에 저장된 이미지 name.gif”)
	imageUrl → imageUrl(”이미지 Url”)
	character → character(”아무 문자열 가능, 이모지도 가능 "😄"")
	alias → alias(”Type alias 처럼 이미 있는 키값의 별명 붙이기 가능”)**
*/
let exampleEmojis: [String: EmojiSource] = [
    "baby_yoda": .imageAsset("baby-yoda-soup.gif"),
    "banana_dance": .imageAsset("bananadance.gif"),
    "excuse_me": .imageAsset("excuseme.gif"),
    "party_parrot": .imageAsset("party_parrot.gif"),
    "this_is_fine": .imageAsset("this-is-fine-fire.gif"),
    "what": .imageAsset("what.png"),
    "homer_disappear": .imageAsset("homer-disappear.gif"),
    "let_me_in": .imageUrl("https://github.com/GetStream/Streamoji/blob/main/meta/emojis/let_me_in.gif?raw=true"),
    "smiley": .character("😄"),
    "heart": .character("❤️"),
    "banana": .alias("banana_dance"),
    "parrot": .alias("party_parrot")
]

/*
	사용 방법
	:원하는Key값: 이 포함된 문자열을 NSAttributedString 형태로 
	TextView에 저장. 
	(정규 표현식에 의해 :(key): 안의 key 값에 대칭되는 value가 있다면 이모지 그림)
*/
textView.attributedText = NSAttributedString(string:
    """
    :banana_dance: Streamoji :party_parrot:
    :baby_yoda: This is a UITextView! :excuse_me:

    Supports:
    GIF :this_is_fine:
    Image :what:
    Local file :homer_disappear:
    Remote file :let_me_in:
    Unicode :smiley:
    """
)

textView.configureEmojis(exampleEmojis, rendering: .highestQuality)
```
        
   
        

### 결과화면

- 이미지

<img width="254" alt="스크린샷 2022-02-04 17 31 00" src="https://user-images.githubusercontent.com/98013729/152496795-1f7358d2-09cc-4a0f-9831-d489a6c05e5e.png">
    
- Stremoji 를 사용했을때 TextView 내부 구성

<img width="504" alt="스크린샷 2022-02-04 17 31 23" src="https://user-images.githubusercontent.com/98013729/152496865-1718ef2f-f26f-4dd0-98f4-b78687557b7d.png">

---

# 성능차이 ( Gifu Vs Stremoji)

### 비교 조건

1. 테이블 뷰, 셀의 개수는 같음
2. 테이블 뷰 셀 하나당 51개의 같은 이모지로 비교
3. Cpu 사용량, 메모리사용량 비교
4. 정지상태, 스크롤 상태 비교

## 1. Stremoji

- **화면 이동 x / 스크롤 **

<p><img width="419" height="300" alt="스크린샷 2022-02-04 17 38 59" src="https://user-images.githubusercontent.com/98013729/152497854-4048a30e-01ee-4230-9089-93e97fbbb390.png">
<img width="419" height="300" alt="스크린샷 2022-02-04 17 39 41" src="https://user-images.githubusercontent.com/98013729/152497958-1cae9992-bc91-4a2f-9efe-13cd5c6a58d5.png"></p>  
    

    

## 2. Gifu

- **화면 이동 x / 스크롤 **
    <p>
      <img width="419" height="300" alt="스크린샷 2022-02-04 17 45 04" src="https://user-images.githubusercontent.com/98013729/152498708-fd4ff697-f501-46a6-9ec4-6d50abc6e1e9.png">
    <img width="419" height="300" alt="스크린샷 2022-02-04 17 45 25" src="https://user-images.githubusercontent.com/98013729/152498768-6bdd365f-c02a-429e-b583-f8cf317d9260.png">
    </p>

---

## 성능 차이 왜이렇게 차이나지? 비슷한구존데 잘 모르겠다.

작성중..


