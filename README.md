# IndividualAssignment2
 

 # Part 1

 # Part 2

 For re-creating the scene in unity, I began by creating a water shader (Editing the one from the lecture) so that the sin wave works a little differently. Instead of it being smooth or a sharp triangle wave, I made it so that it was more boxed out and squared by modifying the vert function. This sader was implemented by adding it to the bottom plane within the scene. This created the moving/box shaped water effect you will see when the game is running. To make this workable, in the vert function, there is a line that looks like this -> float waveHeight = sin(t + v.vertex.x * _Freq) * _Amp + sin(t * 2 + v.vertex.x * _Freq * 2) * _Amp;, and so I edited this line to use a normalize function that looks like this -> float waveHeight = normalize(sin(t + v.vertex.x * _Freq)) * _Amp + normalize(sin(t * 2 + v.vertex.x * _Freq * 2) * _Amp);. By adding this mathimatical function to this line, it will create more of an up and down look in the waves. By doing this, it will create the box shaped waves look. 



![flatWaves](https://user-images.githubusercontent.com/122996304/228300795-bc2dc217-50c2-4852-98e9-887bc524a43e.PNG)

 I added a poly poly paper boat to the scene in which I retreived from online at the unity asset store. Here is the link. https://assetstore.unity.com/packages/3d/lowpoly-paper-boat-61369
 
I then added the toon shading aspect to the water. I created blue ramp texture so that I could add it in. I applied this shader the same way I did with the water one above. Although it is the same, I edited that shader so that it has the toonish effect that you are looking for. To make this happen, I combined the important aspects of the toon shader into the water shader so it works.

![ToonOnWater](https://user-images.githubusercontent.com/122996304/228308960-0d974294-7cdb-4fad-a721-ece3dc2aa7d3.PNG)
![Untitled drawing (1)](https://user-images.githubusercontent.com/122996304/228309256-31f0d5cf-1e5a-4314-bffd-b2a8912e8742.png)

 # Part 3
