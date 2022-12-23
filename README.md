<h1 align='center'><b>🕒 FSOCIETY'S Job Clock</b></a></h1>

<p align='center'><b><a href='https://discord.gg/fsociety'>Discord</a> - <a href='https://store.fsocietystudios.com/'>Website</a> - <a href='https://media.giphy.com/media/z6EG2su1f5jOTourNL/giphy.gif'>Documentation</a></b></h5>
<p align='center'><b>A simple resource that allows you to set yourself clocked in/out in any job!</b></p>

<hr>

## <b>🤔 Can you tell me briefly about this resource?</b>
Using this resource, you'll be able to add targets through ``ox_target`` to clock in/out for any job you'd like!

## <b>⚙️ Great! What dependencies do i need?</b>
In order to use this resource, you'll need:
- An ESX based server [``es_extended``](https://github.com/esx-framework/esx-legacy/)
- [``ox_target``](https://github.com/overextended/ox_target)

## <b>❓ Ok.. but how do i use it?</b>
So in order to use this resource and add jobs correctly you'll need to use the config file provided under ``shared/config.lua``. <br />
In this file you'll find 2 jobs as an example for how to add jobs to this resource.

Open the config file, and you'll see this table:
```lua
Config.Jobs = {
    Police = {
        ClockedInJob = "police",
        ClockedOutJob = "offdutypolice",
        Locations = {
            vec3(440.8877, -981.1199, 30.6896)
        }
    },

    Ambulance = {
        ClockedInJob = "ambulance",
        ClockedOutJob = "offdutyambulance",
        Locations = {
            vec3(260.9588, -1358.3494, 24.5378)
        }
    },
}
```
Lets break it down into pieces.

First of all, we can clearly see that there is a table for every job we are adding to the resource. <br />
<b>In order to add a job, we will need to add a table inside it.</b>

<b>For example:</b> <br />
If I'd like to add a fire department job to this clock in/out resource, my new config will look something like this:

```lua
Config.Jobs = {
    Police = {
        ClockedInJob = "police",
        ClockedOutJob = "offdutypolice",
        Locations = {
            vec3(440.8877, -981.1199, 30.6896)
        }
    },

    Ambulance = {
        ClockedInJob = "ambulance",
        ClockedOutJob = "offdutyambulance",
        Locations = {
            vec3(260.9588, -1358.3494, 24.5378)
        }
    },

    FireDep = {
        ClockedInJob = "fire",
        ClockedOutJob = "offdutyfire",
        Locations = {
            vec3(-632.5477, -121.8778, 39.2291)
        }
    },
}
```

Lets take a closer look on the fields inside the added table.

``ClockedInJob`` is the registered job name that you want the player to have when he is clocked in.<br />
``ClockedOutJob`` is the registered job name that you want the player to have when he is clocked out.<br />
``Locations`` is a table of the locations that the players in the added job will be able to go and clock in/out there.

So, after we have successfully setup our new config file. We will need to register the clock-out job in your server (assuming that you already have your clock-in job working inside your server) <br />
In order to do so, I have left examples inside ``install/job.sql``. (If you want to use the police and ambulance exmaples in your server, make sure to run this sql inside your database)

Let's quickly hover back to our fire dep. example, and i'll show you know how to register the job correctly. <br />
This is how my sql file will look like after adding the clock-out fire job in.

```sql
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
    ('offdutypolice', 'Off-Duty Police', 1),
    ('offdutyambulance', 'Off-Duty Ambulance', 1);
    ('offdutyfire', 'Off-Duty Fire Dep.', 1);

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES 
    ('offdutypolice', 0, 'recruit', 'Off-Duty Recruit', 20, '{}', '{}'),
    ('offdutypolice', 1, 'officer', 'Off-Duty Officer', 40, '{}', '{}'),
    ('offdutypolice', 2, 'sergeant', 'Off-Duty Sergeant', 60, '{}', '{}'),
    ('offdutypolice', 3, 'lieutenant', 'Off-Duty Lieutenant', 85, '{}', '{}'),
    ('offdutypolice', 4, 'boss', 'Off-Duty Captain', 100, '{}', '{}'),
    
    ('offdutyambulance', 0, 'ambulance', 'Off-Duty Jr. EMT', 20, '{}', '{}'),
    ('offdutyambulance', 1, 'doctor', 'Off-Duty EMT', 40, '{}', '{}'),
    ('offdutyambulance', 2, 'cheif_doctor', 'Off-Duty Sr. EMT', 60, '{}', '{}'),
    ('offdutyambulance', 3, 'boss', 'Off-Duty EMT Supervisor', 80, '{}', '{}'),
    
    ('offdutyfire', 0, 'recruit', 'Off-Duty Fire Recruit', 20, '{}', '{}'),
    ('offdutyfire', 1, 'novice', 'Off-Duty Fire Fighter', 40, '{}', '{}'),
    ('offdutyfire', 2, 'experienced', 'Off-Duty Fire General', 60, '{}', '{}'),
    ('offdutyfire', 3, 'boss', 'Off-Duty Fire Boss', 80, '{}', '{}');
```

<b>We can clearly see how ``offdutypolice, offdutyambulance and offdutyfire`` are matching our config file!</b>

After taking a look at ``install/job.sql`` we can see that in order to register a job inside our server we will need to:
- Add the job inside our ``jobs`` table like shown.
- Add the same job grades as the regular job to the off-clock job, inside our ``job_grades`` table like shown.

Last, add ``ensure fs_jobclock`` inside your ``server.cfg`` anywhere below ``es_extended`` & ``ox_target``

If you have done all of those steps correctly - Congratulations! You got the resource working properly!

## <b>🆘 Wait.. But what if i need help?</b>
- [ESX's official Discord server](https://discord.com/invite/RPX2GssV6r)
- [My Discord server](https://discord.gg/fsociety) is a safe place to ask questions. When I have time i'll be more than glad to help!
