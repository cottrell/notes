---
layout: post
title: "UK Tax Calculator 2025-26"
description: "Interactive calculator for UK income tax and National Insurance contributions for 2025-26, with pension contribution scenarios and marginal tax rate visualization."
excerpt: "Calculate your UK tax burden for 2025-26 including income tax, National Insurance, and pension contributions with interactive charts."
tags: [UK, tax, calculator, finance, pension, SIPP, 2025-26]
categories: [Finance, Tools]
---

<script src="https://cdn.jsdelivr.net/npm/echarts@5.4.3/dist/echarts.min.js"></script>

## UK Tax Data 2025-26

<script>
const taxData2025 = {
  year: "2025-26",
  incomeTax: {
    personalAllowance: 12570,
    personalAllowanceReductionStart: 100000,
    personalAllowanceReductionRate: 0.5, // £1 reduction per £2 earned
    bands: [
      { min: 12570, max: 50270, rate: 0.20, name: "Basic Rate" },
      { min: 50270, max: 125140, rate: 0.40, name: "Higher Rate" },
      { min: 125140, max: Infinity, rate: 0.45, name: "Additional Rate" }
    ]
  },
  nationalInsurance: {
    primaryThreshold: 12570, // £242/week * 52
    upperEarningsLimit: 50284, // £967/week * 52
    rates: [
      { min: 0, max: 12570, rate: 0.00, name: "Below Primary Threshold" },
      { min: 12570, max: 50284, rate: 0.08, name: "Main Rate" },
      { min: 50284, max: Infinity, rate: 0.02, name: "Upper Rate" }
    ]
  },
  pension: {
    annualAllowance: 60000,
    minimumContribution: 3600, // even with no earnings
    taperedAllowanceStart: 260000,
    taperedAllowanceMinimum: 10000,
    taperedRate: 0.5 // £1 reduction per £2 earned over threshold
  }
};

function calculatePersonalAllowance(grossIncome) {
  if (grossIncome <= taxData2025.incomeTax.personalAllowanceReductionStart) {
    return taxData2025.incomeTax.personalAllowance;
  }
  
  const reduction = (grossIncome - taxData2025.incomeTax.personalAllowanceReductionStart) * 
                   taxData2025.incomeTax.personalAllowanceReductionRate;
  return Math.max(0, taxData2025.incomeTax.personalAllowance - reduction);
}

function calculateIncomeTax(grossIncome, pensionContribution = 0) {
  const taxableIncome = Math.max(0, grossIncome - pensionContribution);
  const personalAllowance = calculatePersonalAllowance(taxableIncome);
  const taxableAmount = Math.max(0, taxableIncome - personalAllowance);
  
  let tax = 0;
  for (const band of taxData2025.incomeTax.bands) {
    if (taxableAmount > band.min) {
      const taxableInBand = Math.min(taxableAmount, band.max) - band.min;
      tax += taxableInBand * band.rate;
    }
  }
  
  return tax;
}

function calculateNationalInsurance(grossIncome, pensionContribution = 0) {
  const niableIncome = Math.max(0, grossIncome - pensionContribution);
  let ni = 0;
  
  for (const band of taxData2025.nationalInsurance.rates) {
    if (niableIncome > band.min) {
      const niableInBand = Math.min(niableIncome, band.max) - band.min;
      ni += niableInBand * band.rate;
    }
  }
  
  return ni;
}

function calculateMaxPensionContribution(grossIncome) {
  let allowance = taxData2025.pension.annualAllowance;
  
  // Apply tapered allowance for high earners
  if (grossIncome > taxData2025.pension.taperedAllowanceStart) {
    const reduction = (grossIncome - taxData2025.pension.taperedAllowanceStart) * 
                     taxData2025.pension.taperedRate;
    allowance = Math.max(taxData2025.pension.taperedAllowanceMinimum, allowance - reduction);
  }
  
  // Cannot contribute more than 100% of earnings (or £3,600 minimum)
  return Math.min(allowance, Math.max(grossIncome, taxData2025.pension.minimumContribution));
}

function calculateTotalTax(grossIncome, pensionContribution = 0) {
  const incomeTax = calculateIncomeTax(grossIncome, pensionContribution);
  const nationalInsurance = calculateNationalInsurance(grossIncome, pensionContribution);
  
  return {
    incomeTax,
    nationalInsurance,
    total: incomeTax + nationalInsurance,
    netIncome: grossIncome - incomeTax - nationalInsurance - pensionContribution,
    effectiveRate: (incomeTax + nationalInsurance) / grossIncome
  };
}

function calculateMarginalRate(grossIncome, pensionContribution = 0) {
  const increment = 100;
  const current = calculateTotalTax(grossIncome, pensionContribution);
  const higher = calculateTotalTax(grossIncome + increment, pensionContribution);
  
  return (higher.total - current.total) / increment;
}
</script>

## Interactive Calculator

<div style="background: #f5f5f5; padding: 20px; border-radius: 8px; margin: 20px 0;">
  <h3>Tax Calculator</h3>
  <div style="margin-bottom: 15px;">
    <label for="grossIncome">Gross Annual Income (£):</label>
    <input type="number" id="grossIncome" value="50000" min="0" max="1000000" step="1000" 
           style="width: 150px; margin-left: 10px; padding: 5px;">
  </div>
  
  <div style="margin-bottom: 15px;">
    <label for="pensionScenario">Pension Contribution:</label>
    <select id="pensionScenario" style="margin-left: 10px; padding: 5px;">
      <option value="0">No Pension Contribution</option>
      <option value="max">Maximum SIPP Contribution</option>
      <option value="custom">Custom Amount</option>
    </select>
    <input type="number" id="customPension" value="0" min="0" step="1000" 
           style="width: 150px; margin-left: 10px; padding: 5px; display: none;">
  </div>
  
  <button onclick="updateCalculations()" style="padding: 10px 20px; background: #007cba; color: white; border: none; border-radius: 4px; cursor: pointer;">Calculate</button>
</div>

<div id="results" style="display: none;">
  <h3>Results</h3>
  <div id="taxBreakdown" style="background: #f9f9f9; padding: 15px; border-radius: 4px; margin: 10px 0;"></div>
  <div id="comparisonTable" style="margin: 20px 0;"></div>
</div>

<div style="display: flex; gap: 20px; margin-top: 30px;">
  <div id="marginalChart" style="width: 50%; height: 400px;"></div>
  <div id="netIncomeChart" style="width: 50%; height: 400px;"></div>
</div>

<script>
let marginalChart, netIncomeChart;

function updateCalculations() {
  const grossIncome = parseInt(document.getElementById('grossIncome').value) || 0;
  const pensionScenario = document.getElementById('pensionScenario').value;
  
  let pensionContribution = 0;
  if (pensionScenario === 'max') {
    pensionContribution = calculateMaxPensionContribution(grossIncome);
  } else if (pensionScenario === 'custom') {
    pensionContribution = parseInt(document.getElementById('customPension').value) || 0;
  }
  
  // Show results section
  document.getElementById('results').style.display = 'block';
  
  // Calculate scenarios
  const noPension = calculateTotalTax(grossIncome, 0);
  const withPension = calculateTotalTax(grossIncome, pensionContribution);
  const marginalRate = calculateMarginalRate(grossIncome, pensionContribution);
  
  // Update breakdown
  const breakdown = document.getElementById('taxBreakdown');
  breakdown.innerHTML = `
    <h4>Tax Breakdown (Gross Income: £${grossIncome.toLocaleString()})</h4>
    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
      <div>
        <strong>Without Pension Contribution:</strong><br>
        Income Tax: £${noPension.incomeTax.toLocaleString(undefined, {maximumFractionDigits: 0})}<br>
        National Insurance: £${noPension.nationalInsurance.toLocaleString(undefined, {maximumFractionDigits: 0})}<br>
        Total Tax: £${noPension.total.toLocaleString(undefined, {maximumFractionDigits: 0})}<br>
        Net Income: £${noPension.netIncome.toLocaleString(undefined, {maximumFractionDigits: 0})}<br>
        Effective Rate: ${(noPension.effectiveRate * 100).toFixed(1)}%
      </div>
      <div>
        <strong>With £${pensionContribution.toLocaleString()} Pension:</strong><br>
        Income Tax: £${withPension.incomeTax.toLocaleString(undefined, {maximumFractionDigits: 0})}<br>
        National Insurance: £${withPension.nationalInsurance.toLocaleString(undefined, {maximumFractionDigits: 0})}<br>
        Total Tax: £${withPension.total.toLocaleString(undefined, {maximumFractionDigits: 0})}<br>
        Net Income: £${withPension.netIncome.toLocaleString(undefined, {maximumFractionDigits: 0})}<br>
        Effective Rate: ${(withPension.effectiveRate * 100).toFixed(1)}%<br>
        <strong>Tax Saved: £${(noPension.total - withPension.total).toLocaleString(undefined, {maximumFractionDigits: 0})}</strong>
      </div>
    </div>
    <div style="margin-top: 10px;">
      <strong>Marginal Tax Rate: ${(marginalRate * 100).toFixed(1)}%</strong>
    </div>
  `;
  
  // Generate chart data
  const incomes = [];
  const marginalRates = [];
  const netIncomesNoPension = [];
  const netIncomesMaxPension = [];
  
  for (let income = 0; income <= 400000; income += 2000) {
    incomes.push(income);
    
    const noPensionCalc = calculateTotalTax(income, 0);
    const maxPensionContrib = calculateMaxPensionContribution(income);
    const maxPensionCalc = calculateTotalTax(income, maxPensionContrib);
    
    marginalRates.push(calculateMarginalRate(income, 0) * 100);
    netIncomesNoPension.push(noPensionCalc.netIncome);
    netIncomesMaxPension.push(maxPensionCalc.netIncome);
  }
  
  // Update charts
  updateMarginalChart(incomes, marginalRates);
  updateNetIncomeChart(incomes, netIncomesNoPension, netIncomesMaxPension);
}

function updateMarginalChart(incomes, marginalRates) {
  const chartDom = document.getElementById('marginalChart');
  if (!marginalChart) {
    marginalChart = echarts.init(chartDom);
  }
  
  const option = {
    title: {
      text: 'Marginal Tax Rate',
      left: 'center'
    },
    tooltip: {
      trigger: 'axis',
      formatter: function(params) {
        const income = params[0].axisValue;
        const rate = params[0].value;
        return `Income: £${income.toLocaleString()}<br>Marginal Rate: ${rate.toFixed(1)}%`;
      }
    },
    xAxis: {
      type: 'category',
      data: incomes.map(i => i.toLocaleString()),
      axisLabel: {
        formatter: function(value, index) {
          return index % 10 === 0 ? `£${(incomes[index] / 1000).toFixed(0)}k` : '';
        }
      }
    },
    yAxis: {
      type: 'value',
      name: 'Marginal Tax Rate (%)',
      min: 0,
      max: 70
    },
    series: [{
      data: marginalRates,
      type: 'line',
      smooth: true,
      lineStyle: { width: 2 },
      itemStyle: { color: '#e74c3c' }
    }]
  };
  
  marginalChart.setOption(option);
}

function updateNetIncomeChart(incomes, netNoPension, netMaxPension) {
  const chartDom = document.getElementById('netIncomeChart');
  if (!netIncomeChart) {
    netIncomeChart = echarts.init(chartDom);
  }
  
  const option = {
    title: {
      text: 'Net Income After Tax',
      left: 'center'
    },
    tooltip: {
      trigger: 'axis',
      formatter: function(params) {
        const income = params[0].axisValue;
        let result = `Gross: £${income.toLocaleString()}<br>`;
        params.forEach(param => {
          result += `${param.seriesName}: £${param.value.toLocaleString()}<br>`;
        });
        return result;
      }
    },
    legend: {
      data: ['No Pension', 'Max SIPP Contribution'],
      bottom: 10
    },
    xAxis: {
      type: 'category',
      data: incomes.map(i => i.toLocaleString()),
      axisLabel: {
        formatter: function(value, index) {
          return index % 10 === 0 ? `£${(incomes[index] / 1000).toFixed(0)}k` : '';
        }
      }
    },
    yAxis: {
      type: 'value',
      name: 'Net Income (£)',
      axisLabel: {
        formatter: function(value) {
          return `£${(value / 1000).toFixed(0)}k`;
        }
      }
    },
    series: [
      {
        name: 'No Pension',
        data: netNoPension,
        type: 'line',
        smooth: true,
        lineStyle: { width: 2 },
        itemStyle: { color: '#3498db' }
      },
      {
        name: 'Max SIPP Contribution',
        data: netMaxPension,
        type: 'line',
        smooth: true,
        lineStyle: { width: 2 },
        itemStyle: { color: '#2ecc71' }
      }
    ]
  };
  
  netIncomeChart.setOption(option);
}

// Handle pension scenario changes
document.getElementById('pensionScenario').addEventListener('change', function() {
  const customPension = document.getElementById('customPension');
  if (this.value === 'custom') {
    customPension.style.display = 'inline';
  } else {
    customPension.style.display = 'none';
  }
});

// Initial calculation
document.addEventListener('DOMContentLoaded', function() {
  updateCalculations();
});

// Handle window resize for charts
window.addEventListener('resize', function() {
  if (marginalChart) marginalChart.resize();
  if (netIncomeChart) netIncomeChart.resize();
});
</script>

## Tax Rates Summary

The data above uses the following rates for 2025-26:

**Income Tax:**
- Personal Allowance: £12,570 (reduced by £1 for every £2 earned over £100,000)
- Basic Rate: 20% (£12,571 - £50,270)
- Higher Rate: 40% (£50,271 - £125,140)
- Additional Rate: 45% (£125,140+)

**National Insurance:**
- 0% up to £12,570
- 8% on £12,571 - £50,284
- 2% on £50,284+

**SIPP Contributions:**
- Annual Allowance: £60,000 (or 100% of earnings)
- Tapered for earnings over £260,000 (minimum £10,000)
- Minimum contribution: £3,600 (even with no earnings)