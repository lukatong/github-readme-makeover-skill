param(
    [string]$OutputDirectory = (Join-Path $PSScriptRoot "..\..\assets\social-preview")
)

Add-Type -AssemblyName System.Drawing

$width = 1280
$height = 640
$background = [System.Drawing.Color]::FromArgb(18, 22, 27)
$panel = [System.Drawing.Color]::FromArgb(28, 35, 42)
$border = [System.Drawing.Color]::FromArgb(57, 71, 82)
$ink = [System.Drawing.Color]::FromArgb(242, 244, 246)
$muted = [System.Drawing.Color]::FromArgb(170, 184, 194)
$accent = [System.Drawing.Color]::FromArgb(71, 210, 174)
$warning = [System.Drawing.Color]::FromArgb(249, 190, 76)

New-Item -ItemType Directory -Path $OutputDirectory -Force | Out-Null

function New-Font([float]$Size, [System.Drawing.FontStyle]$Style = [System.Drawing.FontStyle]::Regular) {
    return [System.Drawing.Font]::new("Segoe UI", $Size, $Style, [System.Drawing.GraphicsUnit]::Pixel)
}

function Draw-Text([System.Drawing.Graphics]$Graphics, [string]$Text, [System.Drawing.Font]$Font, [System.Drawing.Brush]$Brush, [float]$X, [float]$Y, [float]$Width) {
    $format = [System.Drawing.StringFormat]::new()
    $format.Trimming = [System.Drawing.StringTrimming]::EllipsisCharacter
    $format.FormatFlags = [System.Drawing.StringFormatFlags]::LineLimit
    $rect = [System.Drawing.RectangleF]::new($X, $Y, $Width, 200)
    $Graphics.DrawString($Text, $Font, $Brush, $rect, $format)
}

function Draw-Rule([System.Drawing.Graphics]$Graphics, [float]$X1, [float]$Y1, [float]$X2, [float]$Y2, [System.Drawing.Color]$Color, [float]$Thickness = 1) {
    $pen = [System.Drawing.Pen]::new($Color, $Thickness)
    $Graphics.DrawLine($pen, $X1, $Y1, $X2, $Y2)
    $pen.Dispose()
}

function Draw-Tag([System.Drawing.Graphics]$Graphics, [string]$Text, [float]$X, [float]$Y) {
    $font = New-Font 18 ([System.Drawing.FontStyle]::Bold)
    $size = $Graphics.MeasureString($Text, $font)
    $rect = [System.Drawing.RectangleF]::new($X, $Y, $size.Width + 28, 36)
    $fill = [System.Drawing.SolidBrush]::new($accent)
    $textBrush = [System.Drawing.SolidBrush]::new($background)
    $Graphics.FillRectangle($fill, $rect)
    $Graphics.DrawString($Text, $font, $textBrush, $X + 14, $Y + 7)
    $fill.Dispose()
    $textBrush.Dispose()
    $font.Dispose()
}

function Draw-Card([System.Drawing.Graphics]$Graphics, [string]$Label, [string[]]$Lines, [float]$X, [float]$Y, [float]$Width, [float]$Height, [System.Drawing.Color]$LabelColor = $accent) {
    $fill = [System.Drawing.SolidBrush]::new($panel)
    $stroke = [System.Drawing.Pen]::new($border, 1)
    $labelBrush = [System.Drawing.SolidBrush]::new($LabelColor)
    $bodyBrush = [System.Drawing.SolidBrush]::new($ink)
    $mutedBrush = [System.Drawing.SolidBrush]::new($muted)
    $labelFont = New-Font 17 ([System.Drawing.FontStyle]::Bold)
    $bodyFont = New-Font 22
    $smallFont = New-Font 17
    $rect = [System.Drawing.RectangleF]::new($X, $Y, $Width, $Height)
    $Graphics.FillRectangle($fill, $rect)
    $Graphics.DrawRectangle($stroke, $X, $Y, $Width, $Height)
    $Graphics.DrawString($Label.ToUpperInvariant(), $labelFont, $labelBrush, $X + 24, $Y + 22)
    Draw-Rule $Graphics ($X + 24) ($Y + 58) ($X + $Width - 24) ($Y + 58) $border
    $lineY = $Y + 82
    foreach ($line in $Lines) {
        $brush = if ($line.StartsWith("//")) { $mutedBrush } else { $bodyBrush }
        $display = if ($line.StartsWith("//")) { $line.Substring(2).Trim() } else { $line }
        $font = if ($line.StartsWith("//")) { $smallFont } else { $bodyFont }
        Draw-Text $Graphics $display $font $brush ($X + 24) $lineY ($Width - 48)
        $lineY += if ($line.StartsWith("//")) { 30 } else { 39 }
    }
    $fill.Dispose(); $stroke.Dispose(); $labelBrush.Dispose(); $bodyBrush.Dispose(); $mutedBrush.Dispose()
    $labelFont.Dispose(); $bodyFont.Dispose(); $smallFont.Dispose()
}

function New-Preview([string]$FileName, [string]$Tag, [string]$Title, [string]$Subtitle, [scriptblock]$Card) {
    $bitmap = [System.Drawing.Bitmap]::new($width, $height)
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::ClearTypeGridFit
    $backgroundBrush = [System.Drawing.SolidBrush]::new($background)
    $inkBrush = [System.Drawing.SolidBrush]::new($ink)
    $mutedBrush = [System.Drawing.SolidBrush]::new($muted)
    $titleFont = New-Font 48 ([System.Drawing.FontStyle]::Bold)
    $subtitleFont = New-Font 24
    $graphics.FillRectangle($backgroundBrush, 0, 0, $width, $height)
    Draw-Rule $graphics 64 84 1216 84 $border 2
    Draw-Tag $graphics $Tag 64 112
    Draw-Text $graphics $Title $titleFont $inkBrush 64 170 1080
    Draw-Text $graphics $Subtitle $subtitleFont $mutedBrush 64 235 1060
    & $Card $graphics
    $footerFont = New-Font 16
    $graphics.DrawString("lukatong / open-source documentation tools", $footerFont, $mutedBrush, 64, 596)
    $outputPath = Join-Path $OutputDirectory $FileName
    $bitmap.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)
    $footerFont.Dispose(); $backgroundBrush.Dispose(); $inkBrush.Dispose(); $mutedBrush.Dispose(); $titleFont.Dispose(); $subtitleFont.Dispose(); $graphics.Dispose(); $bitmap.Dispose()
}

New-Preview "github-readme-makeover-skill.png" "SKILL" "GitHub README Makeover" "Audit the first-run path. Verify facts. Write a review-ready proposal." {
    param($graphics)
    Draw-Card $graphics "README audit" @("P1  Docker quick start appears after screenshots", "P2  Persistence warning is far from setup", "// Outcome: a smaller, verifiable README change") 64 330 1152 210
}

New-Preview "readme-fact-checker.png" "CLI" "README Fact Checker" "Deterministic evidence before a documentation rewrite." {
    param($graphics)
    Draw-Card $graphics "REPORT" @("# README Fact Check", "Summary: 0 errors, 0 warnings, 0 info", "// Local files only. No README commands executed.") 64 330 1152 210
}

New-Preview "open-source-screenshot-planner.png" "SKILL" "Open Source Screenshot Planner" "Plan real product evidence, not decorative mockups." {
    param($graphics)
    Draw-Card $graphics "CAPTURE PLAN" @("1  First-run setup", "2  Dashboard after setup", "3  Client portal with shared files", "// Each capture has placement, redaction, and alt text.") 64 315 1152 235
}

New-Preview "readme-makeover-case-tracker.png" "TRACKER" "README Makeover Case Tracker" "Public evidence for proposals, maintainer feedback, and outcomes." {
    param($graphics)
    Draw-Card $graphics "CASE STATUS" @("ProjectSend       proposal-published", "Token Monitor    case-study-complete", "// Status changes require linked public evidence.") 64 330 1152 210 $warning
}
