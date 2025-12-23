{ mylib, lib, config, ... }: 
with mylib; with lib;
{
  appLauncher = {
    customLaunchPrefix = "";
    customLaunchPrefixEnabled = false;
    enableClipPreview = true;
    enableClipboardHistory = false;
    pinnedExecs = [ ];
    position = "center";
    sortByMostUsed = true;
    terminalCommand = "xterm -e";
    useApp2Unit = false;
    viewMode = "list";
  };
  audio = {
    cavaFrameRate = 30;
    externalMixer = "pwvucontrol || pavucontrol";
    mprisBlacklist = [ ];
    preferredPlayer = "";
    visualizerQuality = "high";
    visualizerType = "linear";
    volumeOverdrive = false;
    volumeStep = 5;
  };
  bar = {
    backgroundOpacity = 0;
    capsuleOpacity = 1;
    density = "compact";
    exclusive = true;
    floating = true;
    marginHorizontal = 0.25;
    marginVertical = 0.25;
    monitors = [ ];
    outerCorners = true;
    position = "top";
    showCapsule = false;
    widgets = {
      center = [
        {
          id = "plugin:privacy-indicator";
        }
        {
          hideMode = "hidden";
          hideWhenIdle = false;
          id = "MediaMini";
          maxWidth = 145;
          scrollingMode = "hover";
          showAlbumArt = false;
          showArtistFirst = true;
          showProgressRing = true;
          showVisualizer = false;
          useFixedWidth = false;
          visualizerType = "linear";
        }
      ];
      left = [
        {
          colorizeDistroLogo = false;
          colorizeSystemIcon = "none";
          customIconPath = "";
          enableColorization = false;
          icon = "noctalia";
          id = "ControlCenter";
          useDistroLogo = true;
        }
        {
          characterCount = 2;
          followFocusedScreen = false;
          hideUnoccupied = true;
          id = "Workspace";
          labelMode = "none";
        }
      ];
      right = [
        {
          displayMode = "onhover";
          id = "WiFi";
        }
        (mkIf config.dotfiles.host.bluetooth 
          {
            displayMode = "onhover";
            id = "Bluetooth";
          }
        )
        {
          displayMode = "onhover";
          id = "Volume";
        }
        (mkIf config.dotfiles.host.brightness
          {
            displayMode = "onhover";
            id = "Brightness";
          }
        )
        (mkIf config.dotfiles.host.battery
          {
            displayMode = "alwaysShow";
            id = "Battery";
            warningThreshold = 30;
          }
        )
        {
          customFont = "";
          formatHorizontal = "HH:mm ddd, MMM dd";
          formatVertical = "HH mm - dd MM";
          id = "Clock";
          useCustomFont = false;
          usePrimaryColor = false;
        }
        {
          hideWhenZero = true;
          id = "NotificationHistory";
          showUnreadBadge = true;
        }
      ];
    };
  };
  brightness = {
    brightnessStep = 5;
    enableDdcSupport = true;
    enforceMinimum = true;
  };
  calendar = {
    cards = [
      {
        enabled = true;
        id = "calendar-header-card";
      }
      {
        enabled = true;
        id = "calendar-month-card";
      }
      {
        enabled = true;
        id = "timer-card";
      }
      {
        enabled = false;
        id = "weather-card";
      }
    ];
  };
  changelog = {
    lastSeenVersion = "";
  };
  colorSchemes = {
    darkMode = true;
    generateTemplatesForPredefined = true;
    manualSunrise = "06:30";
    manualSunset = "18:30";
    matugenSchemeType = "scheme-fruit-salad";
    predefinedScheme = "Tokyo Night";
    schedulingMode = "off";
    useWallpaperColors = false;
  };
  controlCenter = {
    cards = [
      {
        enabled = true;
        id = "profile-card";
      }
      {
        enabled = true;
        id = "shortcuts-card";
      }
      {
        enabled = true;
        id = "audio-card";
      }
      {
        enabled = false;
        id = "weather-card";
      }
      {
        enabled = true;
        id = "media-sysmon-card";
      }
    ];
    position = "close_to_bar_button";
    shortcuts = {
      left = [
        {
          id = "WiFi";
        }
        {
          id = "Bluetooth";
        }
        {
          id = "ScreenRecorder";
        }
        {
          id = "WallpaperSelector";
        }
      ];
      right = [
        {
          id = "Notifications";
        }
        # {
        #   id = "PowerProfile";
        # }
        {
          id = "KeepAwake";
        }
        {
          id = "NightLight";
        }
      ];
    };
  };
  dock = {
    backgroundOpacity = 1;
    colorizeIcons = false;
    displayMode = "auto_hide";
    enabled = false;
    floatingRatio = 1;
    monitors = [ ];
    onlySameOutput = true;
    pinnedApps = [ ];
    size = 1;
  };
  general = {
    allowPanelsOnScreenWithoutBar = true;
    animationDisabled = false;
    animationSpeed = 1;
    avatarImage = "";
    boxRadiusRatio = 1;
    compactLockScreen = true;
    dimmerOpacity = 0;
    enableShadows = true;
    forceBlackScreenCorners = false;
    iRadiusRatio = 1;
    language = "";
    lockOnSuspend = true;
    radiusRatio = 1;
    scaleRatio = 1;
    screenRadiusRatio = 1;
    shadowDirection = "bottom_right";
    shadowOffsetX = 2;
    shadowOffsetY = 3;
    showHibernateOnLockScreen = true;
    showScreenCorners = false;
  };
  hooks = {
    darkModeChange = "";
    enabled = false;
    wallpaperChange = "";
  };
  location = {
    analogClockInCalendar = false;
    firstDayOfWeek = -1;
    name = "Tokyo";
    showCalendarEvents = true;
    showCalendarWeather = true;
    showWeekNumberInCalendar = false;
    use12hourFormat = true;
    useFahrenheit = false;
    weatherEnabled = false;
    weatherShowEffects = true;
  };
  network = {
    wifiEnabled = true;
  };
  nightLight = {
    autoSchedule = false;
    dayTemp = "6500";
    enabled = true;
    forced = false;
    manualSunrise = "08:00";
    manualSunset = "18:30";
    nightTemp = "4000";
  };
  notifications = {
    backgroundOpacity = 1;
    criticalUrgencyDuration = 15;
    enableKeyboardLayoutToast = true;
    enabled = true;
    location = "top_right";
    lowUrgencyDuration = 2;
    monitors = [
      "eDP-1"
      "DP-4"
    ];
    normalUrgencyDuration = 4;
    overlayLayer = true;
    respectExpireTimeout = false;
  };
  osd = {
    autoHideMs = 2000;
    backgroundOpacity = 1;
    enabled = true;
    enabledTypes = [
      0
      1
      2
      3
    ];
    location = "top_center";
    monitors = [ ];
    overlayLayer = true;
  };
  screenRecorder = {
    audioCodec = "opus";
    audioSource = "default_output";
    colorRange = "limited";
    directory = "";
    frameRate = 60;
    quality = "very_high";
    showCursor = true;
    videoCodec = "h264";
    videoSource = "portal";
  };
  sessionMenu = {
    countdownDuration = 5000;
    enableCountdown = true;
    position = "center";
    powerOptions = [
      {
        action = "lock";
        command = "";
        countdownEnabled = true;
        enabled = true;
      }
      {
        action = "suspend";
        command = "";
        countdownEnabled = true;
        enabled = true;
      }
      {
        action = "hibernate";
        command = "";
        countdownEnabled = true;
        enabled = true;
      }
      {
        action = "reboot";
        command = "";
        countdownEnabled = true;
        enabled = true;
      }
      {
        action = "logout";
        command = "";
        countdownEnabled = true;
        enabled = true;
      }
      {
        action = "shutdown";
        command = "";
        countdownEnabled = true;
        enabled = true;
      }
    ];
    showHeader = true;
  };
  settingsVersion = 26;
  systemMonitor = {
    cpuCriticalThreshold = 90;
    cpuPollingInterval = 3000;
    cpuWarningThreshold = 80;
    criticalColor = "";
    diskCriticalThreshold = 90;
    diskPollingInterval = 3000;
    diskWarningThreshold = 80;
    memCriticalThreshold = 90;
    memPollingInterval = 3000;
    memWarningThreshold = 80;
    networkPollingInterval = 3000;
    tempCriticalThreshold = 90;
    tempPollingInterval = 3000;
    tempWarningThreshold = 75;
    useCustomColors = false;
    warningColor = "";
  };
  templates = {
    alacritty = false;
    cava = false;
    code = false;
    discord = false;
    emacs = false;
    enableUserTemplates = false;
    foot = false;
    fuzzel = false;
    ghostty = false;
    gtk = false;
    kcolorscheme = false;
    kitty = false;
    niri = false;
    pywalfox = false;
    qt = false;
    spicetify = false;
    telegram = false;
    vicinae = false;
    walker = false;
    wezterm = false;
  };
  ui = {
    fontDefault = "";
    fontDefaultScale = 1;
    fontFixed = "";
    fontFixedScale = 1;
    panelBackgroundOpacity = 1;
    panelsAttachedToBar = true;
    settingsPanelAttachToBar = false;
    tooltipsEnabled = true;
  };
  wallpaper = {
    directory = ../resources/wallpapers;
    enableMultiMonitorDirectories = false;
    enabled = true;
    fillColor = "#000000";
    fillMode = "fill";
    hideWallpaperFilenames = false;
    monitorDirectories = [ ];
    overviewEnabled = true;
    panelPosition = "follow_bar";
    randomEnabled = false;
    randomIntervalSec = 300;
    recursiveSearch = false;
    setWallpaperOnAllMonitors = true;
    transitionDuration = 1500;
    transitionEdgeSmoothness = 0.05;
    transitionType = "random";
    useWallhaven = false;
    wallhavenCategories = "111";
    wallhavenOrder = "desc";
    wallhavenPurity = "100";
    wallhavenQuery = "";
    wallhavenResolutionHeight = "";
    wallhavenResolutionMode = "atleast";
    wallhavenResolutionWidth = "";
    wallhavenSorting = "relevance";
  };
}
