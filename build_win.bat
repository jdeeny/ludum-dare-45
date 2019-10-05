:: Needs to be updated

::zip -r Brugga.zip assets entities gamestates lib physics player ui conf.lua main.lua README.md
::rename Brugga.zip Brugga.love
::mkdir release\Brugga_Windows
::copy /b love.exe+Brugga.love release\Brugga_Windows\Brugga.exe
::del Brugga.love
::copy release\dist\* release\Brugga_Windows
::cd release
::zip -r Brugga_Windows.zip Brugga_Windows
