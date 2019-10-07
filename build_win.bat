:: Needs to be updated

zip -r BirthdaySuit.zip assets entities gamestates lib physics player ui conf.lua main.lua README.md
rename BirthdaySuit.zip BirthdaySuit.love
mkdir release\BirthdaySuit_Windows
copy /b love.exe+BirthdaySuit.love release\BirthdaySuit_Windows\BirthdaySuit.exe
del Brugga.love
copy release\dist\* release\BirthdaySuit_Windows
cd release
zip -r BirthdaySuit_Windows.zip BirthdaySuit_Windows
