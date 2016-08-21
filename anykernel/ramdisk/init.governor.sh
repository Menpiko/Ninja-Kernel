#!/system/bin/sh


#########################
##  GOVERNOR SETTINGS  ##
#########################
# Taken from frap129


########################
##  ONLINE ALL CORES  ##
########################
chmod 644 /sys/devices/system/cpu/online
echo 0-7 > /sys/devices/system/cpu/online
chmod 444 /sys/devices/system/cpu/online
echo 1 > /sys/devices/system/cpu/cpu0/online
echo 1 > /sys/devices/system/cpu/cpu1/online
echo 1 > /sys/devices/system/cpu/cpu2/online
echo 1 > /sys/devices/system/cpu/cpu3/online
echo 1 > /sys/devices/system/cpu/cpu4/online
echo 1 > /sys/devices/system/cpu/cpu5/online
echo 1 > /sys/devices/system/cpu/cpu6/online
echo 1 > /sys/devices/system/cpu/cpu7/online


######################
##  LITTLE CLUSTER  ##
######################
# Governor: chill
# Minimum frequency: 384MHz
# Maxixum frequency: 1708MHz
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
echo chill > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo 384000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo 1708800 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq

# Governor settings
echo 50 > /sys/devices/system/cpu/cpu0/cpufreq/chill/down_threshold
echo 2000 > /sys/devices/system/cpu/cpu0/cpufreq/chill/sampling_rate
echo 95 > /sys/devices/system/cpu/cpu0/cpufreq/chill/up_threshold
echo 10 > /sys/devices/system/cpu/cpu0/cpufreq/chill/sleep_depth
echo 5 > /sys/devices/system/cpu/cpu0/cpufreq/chill/freq_step
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/chill/ignore_nice_load


###################
##  BIG CLUSTER  ##
###################
# Governor: chill
# Minimum frequency: 633MHz
# Maxixum frequency: 2054MHz
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
echo chill > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo 633600 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
echo 2054400 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq

# Governor settings
echo 65 > /sys/devices/system/cpu/cpu4/cpufreq/chill/down_threshold
echo 20000 > /sys/devices/system/cpu/cpu4/cpufreq/chill/sampling_rate
echo 95 > /sys/devices/system/cpu/cpu4/cpufreq/chill/up_threshold
echo 3 > /sys/devices/system/cpu/cpu4/cpufreq/chill/sleep_depth
echo 5 > /sys/devices/system/cpu/cpu4/cpufreq/chill/freq_step
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/chill/ignore_nice_load


###################
##  INPUT BOOST  ##
###################
# 960MHz on little for 40ms
echo 0:960000 1:960000 2:960000 3:960000 4:0 5:0 6:0 7:0 > /sys/module/cpu_boost/parameters/input_boost_freq
echo 0 > /sys/module/cpu_boost/parameters/boost_ms
echo 40 > /sys/module/cpu_boost/parameters/input_boost_ms


########################
##  THERMAL SETTINGS  ##
########################
# Core control disabled, msm_thermal enabled
echo 0 > /sys/module/msm_thermal/core_control/enabled
echo Y > /sys/module/msm_thermal/parameters/enabled
