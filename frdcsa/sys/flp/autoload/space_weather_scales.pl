%% Solar weather event types
isa(geomagnetic_storm, solar_weather_event).
isa(solar_radiation_storm, solar_weather_event).
isa(radio_blackout, solar_weather_event).

%% Geomagnetic storm levels (G scale)
isa(g1, geomagnetic_storm_level).
isa(g2, geomagnetic_storm_level).
isa(g3, geomagnetic_storm_level).
isa(g4, geomagnetic_storm_level).
isa(g5, geomagnetic_storm_level).

comment(g1, 'Minor geomagnetic storm level').
comment(g2, 'Moderate geomagnetic storm level').
comment(g3, 'Strong geomagnetic storm level').
comment(g4, 'Severe geomagnetic storm level').
comment(g5, 'Extreme geomagnetic storm level').

genls(g1, geomagnetic_storm).
genls(g2, geomagnetic_storm).
genls(g3, geomagnetic_storm).
genls(g4, geomagnetic_storm).
genls(g5, geomagnetic_storm).

kp_value(g1, 5).
kp_value(g2, 6).
kp_value(g3, 7).
kp_value(g4, 8). 
kp_value(g5, 9).

effect(g1, 'Weak power grid fluctuations can occur. Minor impact on satellite operations possible. Aurora commonly visible at high latitudes.').
effect(g2, 'High-latitude power systems may experience voltage alarms. Corrective actions to satellite orientation may be required. HF radio propagation can fade at higher latitudes.').
effect(g3, 'Voltage corrections may be required. Surface charging may occur on satellite components. Intermittent satellite navigation and HF radio problems may occur.').
effect(g4, 'Possible widespread voltage control problems. Satellites may experience surface charging and tracking problems. Induced pipeline currents affect preventive measures.').
effect(g5, 'Widespread voltage control and protective system problems can occur. Satellites may experience extensive surface charging and orientation problems. HF radio propagation may be impossible in many areas.').

%% Solar radiation storm levels (S scale)  
isa(s1, solar_radiation_storm_level).
isa(s2, solar_radiation_storm_level).
isa(s3, solar_radiation_storm_level).
isa(s4, solar_radiation_storm_level). 
isa(s5, solar_radiation_storm_level).

comment(s1, 'Minor solar radiation storm level').
comment(s2, 'Moderate solar radiation storm level').
comment(s3, 'Strong solar radiation storm level').
comment(s4, 'Severe solar radiation storm level').
comment(s5, 'Extreme solar radiation storm level').

genls(s1, solar_radiation_storm).  
genls(s2, solar_radiation_storm).
genls(s3, solar_radiation_storm).
genls(s4, solar_radiation_storm).
genls(s5, solar_radiation_storm).

flux_level(s1, 10).
flux_level(s2, 10^2).
flux_level(s3, 10^3).
flux_level(s4, 10^4).
flux_level(s5, 10^5).

effect(s1, 'Minor impacts on HF radio in the polar regions.').
effect(s2, 'Elevated radiation risk for passengers and crew in high-flying aircraft at high latitudes. Small effects on HF propagation and navigation at polar locations.').
effect(s3, 'Radiation hazard avoidance recommended for astronauts on EVA. Single-event upsets likely in satellites. Degraded HF radio propagation and navigation errors likely.').
effect(s4, 'Unavoidable radiation hazard to astronauts on EVA. Satellites may experience memory device problems. Blackout of HF radio communications through polar regions.').  
effect(s5, 'Unavoidable high radiation hazard to astronauts on EVA. Satellites may be rendered useless. Complete blackout of HF communications possible through polar regions.').

%% Radio blackout levels (R scale)
isa(r1, radio_blackout_level).
isa(r2, radio_blackout_level).  
isa(r3, radio_blackout_level).
isa(r4, radio_blackout_level).
isa(r5, radio_blackout_level).

comment(r1, 'Minor radio blackout level'). 
comment(r2, 'Moderate radio blackout level').
comment(r3, 'Strong radio blackout level').
comment(r4, 'Severe radio blackout level').  
comment(r5, 'Extreme radio blackout level').

genls(r1, radio_blackout).
genls(r2, radio_blackout).
genls(r3, radio_blackout). 
genls(r4, radio_blackout).
genls(r5, radio_blackout).

flux_level(r1, 10^-5). 
flux_level(r2, 5*10^-5).
flux_level(r3, 10^-4).
flux_level(r4, 10^-3).
flux_level(r5, 2*10^-3).

effect(r1, 'Weak or minor degradation of HF radio communication on sunlit side. Low-frequency navigation signals degraded for brief intervals.').
effect(r2, 'Limited blackout of HF radio communication on sunlit side. Degradation of low-frequency navigation signals for tens of minutes.').  
effect(r3, 'Wide area blackout of HF radio communication on sunlit side of Earth. Low-frequency navigation signals degraded for about an hour.').
effect(r4, 'HF radio communication blackout on most of the sunlit side of Earth for one to two hours. Outages of low-frequency navigation signals.').
effect(r5, 'Complete HF radio blackout on the entire sunlit side of the Earth lasting for hours. Low-frequency navigation signals experience outages for many hours.').
