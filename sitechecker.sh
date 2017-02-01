#!/bin/bash

HOME='/home/bill/Backups'
EMAIL='billmckinley@hotmail.com'
FRANK='huntohio@hotmail.com'

cd $HOME

echo >> website_log-$(date '+%F').txt 2>&1
echo "********************************************************************" >> website_log-$(date '+%F').txt 2>&1
wget http://hearts4horses.com >> website_log-$(date '+%F').txt 2>&1
HEARTCODE=$?
 if [ $HEARTCODE -eq 0 ]; then
  echo "Hearts4Horses.Com up at $(date)" >> website_log-$(date '+%F').txt 2>&1
 else
  echo "Exit code $HEARTCODE on Hearts4Horses.Com at $(date)" >> website_log-$(date '+%F').txt 2>&1
  echo "Alert email sent to $EMAIL" >> website_log-$(date '+%F').txt 2>&1
  echo -e "Please check website.  If the site is down, please contact Tech Support at (916) 477-9555.\n 
	$(tail -n 6 website_log-$(date '+%F').txt)" | mail -s "Hearts4Horses.Com is DOWN" $EMAIL
 fi

echo >> website_log-$(date '+%F').txt 2>&1
echo "********************************************************************" >> website_log-$(date '+%F').txt 2>&1
wget http://meetingamericasmustangs.com >> website_log-$(date '+%F').txt 2>&1
MUSTANGCODE=$?
 if [ $MUSTANGCODE -eq 0 ]; then
  echo "MeetingAmericasMustangs.Com up at $(date)" >> website_log-$(date '+%F').txt 2>&1
 else
  echo "Exit code $MUSTANGCODE on MeetingAmericasMustangs.Com at $(date)" >> website_log-$(date '+%F').txt 2>&1
  echo "Alert email sent to $EMAIL" >> website_log-$(date '+%F').txt 2>&1
  echo -e "Please check website. If the site is down, please contact Tech Support at (916) 477-9555.\n 
	$(tail -n 6 website_log-$(date '+%F').txt)" | mail -s "MeetingAmericasMustangs.Com is DOWN" $EMAIL
 fi

echo >> website_log-$(date '+%F').txt 2>&1
echo "********************************************************************" >> website_log-$(date '+%F').txt 2>&1
wget http://inhomepetnannies.com >> website_log-$(date '+%F').txt 2>&1
PETCODE=$?
 if [ $PETCODE -eq 0 ]; then
  echo "inhomepetnannies.com up at $(date)" >> website_log-$(date '+%F').txt 2>&1
 else
  echo "Exit code $PETCODE on inhomepetnannies.com at $(date)" >> website_log-$(date '+%F').txt 2>&1
  echo "Alert email sent to $EMAIL" >> website_log-$(date '+%F').txt 2>&1
  echo -e "Please check website. If the site is down, please contact Tech Support at (916) 477-9555.\n 
	$(tail -n 6 website_log-$(date '+%F').txt)" | mail -s "inhomepetnannies.com is DOWN" $EMAIL peggymckinley@hotmail.com
 fi

#echo >> website_log-$(date '+%F').txt 2>&1
#echo "********************************************************************" >> website_log-$(date '+%F').txt 2>&1
#wget http://oldcrowink.com >> website_log-$(date '+%F').txt 2>&1
#CROWCODE=$?
# if [ $CROWCODE -eq 0 ]; then
#  echo "oldcrowink.com up at $(date)" >> website_log-$(date '+%F').txt 2>&1
# else
#  echo "Exit code $CROWCODE on oldcrowink.com at $(date)" >> website_log-$(date '+%F').txt 2>&1
#  echo "Alert email sent to $EMAIL" >> website_log-$(date '+%F').txt 2>&1
#  echo -e "Please check website. If the site is down, please contact Tech Support at (916) 477-9555.\n 
#	$(tail -n 6 website_log-$(date '+%F').txt)" | mail -s "oldcrowink.com is DOWN" $EMAIL billm41@att.net
# fi

echo >> website_log-$(date '+%F').txt 2>&1
echo "********************************************************************" >> website_log-$(date '+%F').txt 2>&1
wget http://vanarsdallcpa.com >> website_log-$(date '+%F').txt 2>&1
EVACODE=$?
 if [ $EVACODE -eq 0 ]; then
  echo "vanarsdallcpa.com up at $(date)" >> website_log-$(date '+%F').txt 2>&1
 else
  echo "Exit code $EVACODE on vanarsdallcpa.com at $(date)" >> website_log-$(date '+%F').txt 2>&1
  echo "Alert email sent to $EMAIL" >> website_log-$(date '+%F').txt 2>&1
  echo -e "Please check website. If the site is down, please contact Tech Support at (916) 477-9555.\n 
	$(tail -n 6 website_log-$(date '+%F').txt)" | mail -s "vanarsdallcpa.com is DOWN" $EMAIL eleanorvan@hotmail.com
 fi

#echo >> website_log-$(date '+%F').txt 2>&1
#echo "********************************************************************" >> website_log-$(date '+%F').txt 2>&1
#wget http://ohiotimber.com >> website_log-$(date '+%F').txt 2>&1
#TIMBERCODE=$?
# if [ $TIMBERCODE -eq 0 ]; then
#  echo "ohiotimber.com up at $(date)" >> website_log-$(date '+%F').txt 2>&1
# else
#  echo "Exit code $TIMBERCODE on ohiotimber.com at $(date)" >> website_log-$(date '+%F').txt 2>&1
#  echo "Alert email sent to $EMAIL" >> website_log-$(date '+%F').txt 2>&1
#  echo -e "Please check website. If the site is down, please contact Tech Support at (916) 477-9555.\n 
#	$(tail -n 6 website_log-$(date '+%F').txt)" | mail -s "ohiotimber.com is DOWN" $EMAIL huntohio@hotmail.com 
# fi

#echo >> website_log-$(date '+%F').txt 2>&1
#echo "********************************************************************" >> website_log-$(date '+%F').txt 2>&1
#wget http://ohiofarmandhuntingland.com >> website_log-$(date '+%F').txt 2>&1
#OHFARMCODE=$?
# if [ $OHFARMCODE -eq 0 ]; then
#  echo "ohiofarmandhuntingland.com up at $(date)" >> website_log-$(date '+%F').txt 2>&1
# else
#  echo "Exit code $OHFARMCODE on ohiofarmandhuntingland.com at $(date)" >> website_log-$(date '+%F').txt 2>&1 
#  echo "Alert email sent to $EMAIL $FRANK" >> website_log-$(date '+%F').txt 2>&1
#  echo -e "Please check website. If the site is down, please contact Tech Support at (916) 477-9555.\n 
#	$(tail -n 6 website_log-$(date '+%F').txt)" | mail -s "ohiofarmandhuntingland.com is DOWN" $EMAIL $FRANK
# fi

#echo >> website_log-$(date '+%F').txt 2>&1
#echo "********************************************************************" >> website_log-$(date '+%F').txt 2>&1
#wget http://ohiohuntingandfarmland.com >> website_log-$(date '+%F').txt 2>&1
#OHHUNTCODE=$?
# if [ $OHHUNTCODE -eq 0 ]; then
#  echo "ohiohuntingandfarmland.com up at $(date)" >> website_log-$(date '+%F').txt 2>&1
# else
#  echo "Exit code $OHHUNTCODE on ohiohuntingandfarmland.com at $(date)" >> website_log-$(date '+%F').txt 2>&1
#  echo "Alert email sent to $EMAIL $FRANK" >> website_log-$(date '+%F').txt 2>&1
#  echo -e "Please check website. If the site is down, please contact Tech Support at (916) 477-9555.\n
#	 $(tail -n 6 website_log-$(date '+%F').txt)" | mail -s "ohiohuntingandfarmland.com is DOWN" $EMAIL $FRANK
# fi

#echo >> website_log-$(date '+%F').txt 2>&1
#echo "********************************************************************" >> website_log-$(date '+%F').txt 2>&1
#wget http://ohiolandrealty.com >> website_log-$(date '+%F').txt 2>&1
#OHLANDCODE=$?
# if [ $OHLANDCODE -eq 0 ]; then
#  echo "ohiolandrealty.com up at $(date)" >> website_log-$(date '+%F').txt 2>&1
# else
#  echo "Exit code $OHLANDCODE on ohiolandrealty.com at $(date)" >> website_log-$(date '+%F').txt 2>&1
#  echo "Alert email sent to $EMAIL $FRANK" >> website_log-$(date '+%F').txt 2>&1
#  echo -e "Please check website. If the site is down, please contact Tech Support at (916) 477-9555.\n
#         $(tail -n 6 website_log-$(date '+%F').txt)" | mail -s "ohiolandrealty.com is DOWN" $EMAIL $FRANK
# fi

#echo >> website_log-$(date '+%F').txt 2>&1
#echo "********************************************************************" >> website_log-$(date '+%F').txt 2>&1
#wget http://huntmonsterbucks.com >> website_log-$(date '+%F').txt 2>&1
#HUNTMONSCODE=$?
# if [ $HUNTMONSCODE -eq 0 ]; then
#  echo "huntmonsterbucks.com up at $(date)" >> website_log-$(date '+%F').txt 2>&1
# else
#  echo "Exit code $HUNTMONSCODE on huntmonsterbucks.com at $(date)" >> website_log-$(date '+%F').txt 2>&1
#  echo "Alert email sent to $EMAIL $FRANK" >> website_log-$(date '+%F').txt 2>&1
#  echo -e "Please check website. If the site is down, please contact Tech Support at (916) 477-9555.\n
#         $(tail -n 6 website_log-$(date '+%F').txt)" | mail -s "huntmonsterbucks.com is DOWN" $EMAIL $FRANK
# fi

echo >> website_log-$(date '+%F').txt 2>&1
echo "********************************************************************" >> website_log-$(date '+%F').txt 2>&1


#Remove downloaded pages:
rm *\.html*


exit 0
