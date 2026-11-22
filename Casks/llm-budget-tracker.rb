# Version and sha256 are updated by scripts/publish-release.sh in krohn/llm-budget-tracker for each release.
cask "llm-budget-tracker" do
  version "0.1.2"
  sha256 "eb80dcff538dc6b7dfd5432afb38c962bdf9772b912e3bb5fb547a734fae81cc"

  url "https://github.com/krohn/llm-budget-tracker/releases/download/v#{version}/LLMBudgetTracker-#{version}.dmg"
  name "LLM Budget Tracker"
  desc "Menu bar app showing the budget of a LiteLLM proxy"
  homepage "https://github.com/krohn/llm-budget-tracker"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "LLMBudgetTracker.app"

  zap trash: "~/Library/Preferences/io.krohn.llm-budget-tracker.plist"

  caveats <<~EOS
    The app is not notarized, so macOS blocks the first launch. Allow it once under
    System Settings → Privacy & Security → Open Anyway, or remove the quarantine flag:
      xattr -dr com.apple.quarantine #{appdir}/LLMBudgetTracker.app
  EOS
end
