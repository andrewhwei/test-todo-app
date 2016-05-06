require 'rails_helper'

RSpec.describe Task, type: :model do
  
  describe '#toggle_complete!' do
    it 'should switch complete to false if it began as true' do
      task = Task.new(complete: true)
      task.toggle_complete!
      expect(task.complete).to eq(false)
    end

    it 'should switch complete to true if it began as false' do
      task = Task.new(complete: false)
      task.toggle_complete!
      expect(task.complete).to eq(true)
    end
  end

  describe '#toggle_favorite!' do
    it 'should switch favorite to false if it began as true' do
      task = Task.new(favorite: true)
      task.toggle_favorite!
      expect(task.favorite).to eq(false)
    end

    it 'should switch favorite to true if it began as false' do
      task = Task.new(favorite: false)
      task.toggle_favorite!
      expect(task.favorite).to eq(true)
    end
  end

  describe '#overdue?' do
    it 'should return true if Time.now is greater than deadline' do
      task = Task.new(deadline: 1.day.ago)
      overdue = task.overdue?
      expect(overdue).to eq(true)
    end

    it 'should return false if Time.now is less than deadline' do
      task = Task.new(deadline: "2200-05-19 10:30:14")
      overdue = task.overdue?
      expect(overdue).to eq(false)
    end
  end

  describe '#increment_priority!' do
    it 'should increment priority by 1 if priority is less than 10' do
      task = Task.new(priority: 0)
      task.increment_priority!
      expect(task.priority).to eq(1)
    end

    it 'should increment priority by 1 if priority is less than 10' do
      task = Task.new(priority: 9)
      task.increment_priority!
      expect(task.priority).to eq(10)
    end

    it 'should not increment priority by 1 if priority is greater than or equal to 10' do
      task = Task.new(priority: 10)
      task.increment_priority!
      expect(task.priority).to eq(10)
    end
  end

  describe '#decrement_priority!' do
    it 'should decrement priority by 1, as long as priority is greater than 1' do
      task = Task.new(priority: 9)
      task.decrement_priority!
      expect(task.priority).to eq(8)
    end

    it 'shouldnt decrement priority by 1, if priority is less than or equal to 1' do
      task = Task.new(priority: 1)
      task.decrement_priority!
      expect(task.priority).to eq(1)
    end
  end


  describe '#snooze_hour!' do
    it 'should add an hour to the deadline' do
      task = Task.new(deadline: "2011-05-19 10:30:14")
      task.snooze_hour!
      expect(task.deadline).to eq("2011-05-19 11:30:14")
    end
  end


end



















